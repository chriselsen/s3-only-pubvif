const https = require('https');

// AWS SDK v3 is included in Lambda runtime
const { SecretsManagerClient, GetSecretValueCommand } = require('@aws-sdk/client-secrets-manager');

const secretsClient = new SecretsManagerClient({
  region: process.env.AWS_REGION || 'us-east-1'
});

// Cache for secrets (persists across Lambda invocations in the same container)
let cachedSecrets = null;

async function getSecrets() {
  if (cachedSecrets) {
    return cachedSecrets;
  }

  const secretName = process.env.SECRET_NAME || 'github-webhook-credentials';

  try {
    const command = new GetSecretValueCommand({ SecretId: secretName });
    const response = await secretsClient.send(command);
    cachedSecrets = JSON.parse(response.SecretString);
    return cachedSecrets;
  } catch (error) {
    console.error(`Failed to retrieve secret '${secretName}':`, error.message);
    throw error;
  }
}

const doPostRequest = (repo, secrets) => {
  const data = { "event_type": "webhook" };

  return new Promise((resolve, reject) => {
    const options = {
      host: 'api.github.com',
      path: `/repos/${secrets.GITHUB_OWNER}/${repo}/dispatches`,
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${secrets.GITHUB_TOKEN}`,
        'Accept': 'application/vnd.github+json',
        'X-GitHub-Api-Version': '2022-11-28',
        'User-Agent': 'AWS Lambda'
      }
    };

    const req = https.request(options, (res) => {
      resolve({repo, statusCode: res.statusCode});
    });

    req.on('error', (e) => {
      reject({repo, error: e.message});
    });

    req.write(JSON.stringify(data));
    req.end();
  });
};

exports.handler = async (event) => {
  try {
    const secrets = await getSecrets();
    const repos = secrets.GITHUB_REPOS.split(',');

    const results = await Promise.allSettled(
      repos.map(repo => doPostRequest(repo.trim(), secrets))
    );

    results.forEach((result, index) => {
      const repo = repos[index].trim();
      if (result.status === 'fulfilled') {
        console.log(`${repo}: Status code ${result.value.statusCode}`);
      } else {
        console.error(`${repo}: Error ${result.reason.error || result.reason}`);
      }
    });

    const successful = results.filter(r => r.status === 'fulfilled').length;
    const failed = results.filter(r => r.status === 'rejected').length;

    return {
      statusCode: failed === 0 ? 200 : 207,
      body: JSON.stringify({
        message: `Webhook dispatched: ${successful} succeeded, ${failed} failed`,
        repos: repos.map(r => r.trim())
      })
    };
  } catch (error) {
    console.error('Failed to process webhook:', error);
    return {
      statusCode: 500,
      body: JSON.stringify({ error: 'Failed to dispatch webhook' })
    };
  }
};

const https = require('https');

const doPostRequest = (repo) => {

  const data = {
    "event_type": "webhook"
  };

  return new Promise((resolve, reject) => {
    const options = {
      host: 'api.github.com',
      path: `/repos/${process.env.GITHUB_OWNER}/${repo}/dispatches`,
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${process.env.GITHUB_TOKEN}`,
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
  const repos = process.env.GITHUB_REPOS.split(',');
  
  await Promise.all(repos.map(repo => 
    doPostRequest(repo.trim())
      .then(result => console.log(`${result.repo}: Status code ${result.statusCode}`))
      .catch(err => console.error(`${err.repo}: Error ${err.error}`))
  ));
};

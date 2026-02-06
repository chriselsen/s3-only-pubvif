# S3-only Public VIF Prefix Lists

This repository contains BGP prefix lists for filtering S3 traffic over AWS Direct Connect Public VIF.

## Why?

To use S3 with Direct Connect, customers often use a Public VIF. By filtering to only S3 prefixes for specific regions, you can limit the scope of routes received from AWS (AS16509). This allows you to route only S3 traffic over the Direct Connect connection while sending all other AWS traffic (EC2, etc.) over the Internet, reducing Direct Connect data transfer costs and bandwidth usage.

## Architecture

```
┌─────────────────┐                                    ┌─────────────────┐
│                 │                                    │                 │
│  Customer       │                                    │      AWS        │
│  Network        │                                    │                 │
│  ┌──────────┐   │                                    │   ┌──────────┐  │
│  │  Router  │   │    Direct Connect Public VIF       │   │    S3    │  │
│  │  (with   │───┼───────────────────────────────────>│   │ (Region) │  │
│  │ filters) │   │    ✓ S3 prefixes only (filtered)   │   └──────────┘  │
│  └────┬─────┘   │                                    │                 │
│       │         │                                    │   ┌──────────┐  │
│       │         │         Internet                   │   │   EC2    │  │
│       └─────────┼───────────────────────────────────>│   │  Other   │  │
│                 │    ✓ All other AWS traffic         │   │ Services │  │
│                 │                                    │   └──────────┘  │
└─────────────────┘                                    └─────────────────┘
```

With BGP prefix filtering in place:
- Traffic to S3 in the specified region → Direct Connect Public VIF
- All other AWS traffic (EC2, other services) → Internet

**Important:** These prefix filters only control outbound traffic from your network to AWS. Return traffic from AWS to your network will use whichever path AWS chooses based on the prefixes you announce via BGP.

## Configuration Files

Last updated: {{TIMESTAMP}}

### Per-Region Configs

| Region | Country | Region Name | Cisco IOS | Juniper | Arista EOS | Nokia SR OS | Mikrotik |
| --- | --- | --- | --- | --- | --- | --- | --- |
{{REGION_TABLE}}

### Combined Region Configs

For convenience, combined configs aggregate prefixes from multiple regions:

| Group | Description | Cisco IOS | Juniper | Arista EOS | Nokia SR OS | Mikrotik |
| --- | --- | --- | --- | --- | --- | --- |
{{GROUP_TABLE}}

## Data Export

Machine-readable prefix data is available in JSON and YAML formats:
- [s3-prefixes.json](../../raw/main/data/s3-prefixes.json)
- [s3-prefixes.yaml](../../raw/main/data/s3-prefixes.yaml)

## Usage

### Cisco IOS / Arista EOS

```
ip prefix-list aws-s3-<region> seq <N> permit <prefix> le 24
ipv6 prefix-list aws-s3-<region> seq <N> permit <prefix> le 48
```

For more information on configuring prefix lists in Cisco IOS, see:
- [BGP Prefix Filtering - Noction](https://www.noction.com/knowledge-base/bgp-prefix-filtering)

### Juniper

```
policy-options {
    prefix-list aws-s3-<region> {
        <prefix> orlonger;
    }
}
```

For more information on configuring prefix lists in Juniper, see:
- [Juniper: Example: Configuring a Prefix List](https://www.juniper.net/documentation/us/en/software/junos/routing-policy/topics/example/policy-prefix-list.html)

### Nokia SR OS

```
/configure {
    router Base {
        policy-options {
            prefix-list "aws-s3-<region>" {
                prefix <prefix> type longer {
                }
            }
        }
    }
}
```

### Mikrotik RouterOS

```
/ip firewall address-list add list=aws-s3-<region> address=<prefix>
/ipv6 firewall address-list add list=aws-s3-<region> address=<prefix>
```

Import the `.rsc` files directly with: `/import file-name=mikrotik-s3-<region>.rsc`

## Automation

This repository is automatically updated via GitHub Actions when AWS publishes changes to ip-ranges.json.

### Setting up the Lambda Webhook

To automatically trigger updates when AWS publishes a new ip-ranges.json file:

1. Create a secret in AWS Secrets Manager named `github-webhook-credentials`:
   ```json
   {
     "GITHUB_OWNER": "your-username",
     "GITHUB_TOKEN": "ghp_your_token",
     "GITHUB_REPOS": "s3-only-pubvif"
   }
   ```

2. Subscribe an AWS Lambda function to the SNS topic `arn:aws:sns:us-east-1:806199016981:AmazonIpSpaceChanged`

3. Use the Lambda function code from `lambda-webhook-trigger.js` in this repository

4. Add IAM permission for `secretsmanager:GetSecretValue` to the Lambda execution role

5. Set environment variable `SECRET_NAME` (optional, defaults to `github-webhook-credentials`)

### Testing the Webhook

To manually trigger the workflow for testing:

```bash
curl -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer YOUR_GITHUB_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/{{OWNER}}/s3-only-pubvif/dispatches \
  -d '{"event_type":"webhook"}'
```

Or use the GitHub UI:
- Go to the **Actions** tab in your repository
- Select the **generate-s3-prefix-lists** workflow
- Click **Run workflow** → **Run workflow**

Check the Actions tab to see the workflow run and verify it completes successfully.

### Tracking Updates

To receive notifications when S3 prefix lists are updated:

1. **Watch this repository**: Click "Watch" → "All Activity" at the top of the page
2. **Subscribe to releases**: Click "Watch" → "Custom" → Check "Releases" (a release is created for each update)
3. **RSS feed**: Subscribe to the commits feed: `https://github.com/{{OWNER}}/s3-only-pubvif/commits/main.atom`

## Notes

- Excludes China regions (cn-north-1, cn-northwest-1)
- IPv4 prefixes use 'le 24' to match more specific BGP announcements
- IPv6 prefixes use 'le 48' to match more specific BGP announcements
- Config files are only updated when actual IP ranges change

## Additional Considerations

While the prefix filters above reduce the number of routes received from AWS, you should also consider limiting the prefixes announced from your network to AWS.

Currently, AWS does not support filtering return traffic to only S3. Any prefixes you announce via the Direct Connect Public VIF will be reachable from all AWS services, not just S3. This means that even if you only accept S3 routes from AWS, traffic from EC2 and other services can still reach your network via Direct Connect.

**Recommended approach:** Announce only a /32 IPv4 prefix (single IP address) to AWS and use NAT/PAT (Port Address Translation) on your router to access S3. This minimizes your exposure while still allowing S3 traffic over Direct Connect.

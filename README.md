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

Last updated: 2026-08-13 00:07:24 UTC

| Region | Country | Region Name | Cisco IOS | Juniper |
| --- | --- | --- | --- | --- |
| af-south-1 | <img src="../../raw/main/images/flags/za.svg" width="25px"> South Africa | Africa (Cape Town) | [Cisco Config](../../raw/main/configs/cisco-s3-af-south-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-af-south-1.txt) |
| ap-east-1 | <img src="../../raw/main/images/flags/hk.svg" width="25px"> Hong Kong | Asia Pacific (Hong Kong) | [Cisco Config](../../raw/main/configs/cisco-s3-ap-east-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-ap-east-1.txt) |
| ap-east-2 | <img src="../../raw/main/images/flags/tw.svg" width="25px"> Taiwan | Asia Pacific (Taipei) | [Cisco Config](../../raw/main/configs/cisco-s3-ap-east-2.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-ap-east-2.txt) |
| ap-northeast-1 | <img src="../../raw/main/images/flags/jp.svg" width="25px"> Japan | Asia Pacific (Tokyo) | [Cisco Config](../../raw/main/configs/cisco-s3-ap-northeast-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-ap-northeast-1.txt) |
| ap-northeast-2 | <img src="../../raw/main/images/flags/kr.svg" width="25px"> South Korea | Asia Pacific (Seoul) | [Cisco Config](../../raw/main/configs/cisco-s3-ap-northeast-2.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-ap-northeast-2.txt) |
| ap-northeast-3 | <img src="../../raw/main/images/flags/jp.svg" width="25px"> Japan | Asia Pacific (Osaka) | [Cisco Config](../../raw/main/configs/cisco-s3-ap-northeast-3.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-ap-northeast-3.txt) |
| ap-south-1 | <img src="../../raw/main/images/flags/in.svg" width="25px"> India | Asia Pacific (Mumbai) | [Cisco Config](../../raw/main/configs/cisco-s3-ap-south-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-ap-south-1.txt) |
| ap-south-2 | <img src="../../raw/main/images/flags/in.svg" width="25px"> India | Asia Pacific (Hyderabad) | [Cisco Config](../../raw/main/configs/cisco-s3-ap-south-2.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-ap-south-2.txt) |
| ap-southeast-1 | <img src="../../raw/main/images/flags/sg.svg" width="25px"> Singapore | Asia Pacific (Singapore) | [Cisco Config](../../raw/main/configs/cisco-s3-ap-southeast-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-ap-southeast-1.txt) |
| ap-southeast-2 | <img src="../../raw/main/images/flags/au.svg" width="25px"> Australia | Asia Pacific (Sydney) | [Cisco Config](../../raw/main/configs/cisco-s3-ap-southeast-2.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-ap-southeast-2.txt) |
| ap-southeast-3 | <img src="../../raw/main/images/flags/id.svg" width="25px"> Indonesia | Asia Pacific (Jakarta) | [Cisco Config](../../raw/main/configs/cisco-s3-ap-southeast-3.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-ap-southeast-3.txt) |
| ap-southeast-4 | <img src="../../raw/main/images/flags/au.svg" width="25px"> Australia | Asia Pacific (Melbourne) | [Cisco Config](../../raw/main/configs/cisco-s3-ap-southeast-4.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-ap-southeast-4.txt) |
| ap-southeast-5 | <img src="../../raw/main/images/flags/my.svg" width="25px"> Malaysia | Asia Pacific (Kuala Lumpur) | [Cisco Config](../../raw/main/configs/cisco-s3-ap-southeast-5.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-ap-southeast-5.txt) |
| ap-southeast-6 | <img src="../../raw/main/images/flags/nz.svg" width="25px"> New Zealand | Asia Pacific (Auckland) | [Cisco Config](../../raw/main/configs/cisco-s3-ap-southeast-6.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-ap-southeast-6.txt) |
| ap-southeast-7 | <img src="../../raw/main/images/flags/th.svg" width="25px"> Thailand | Asia Pacific (Bangkok) | [Cisco Config](../../raw/main/configs/cisco-s3-ap-southeast-7.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-ap-southeast-7.txt) |
| ca-central-1 | <img src="../../raw/main/images/flags/ca.svg" width="25px"> Canada | Canada (Central) | [Cisco Config](../../raw/main/configs/cisco-s3-ca-central-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-ca-central-1.txt) |
| ca-west-1 | <img src="../../raw/main/images/flags/ca.svg" width="25px"> Canada | Canada (West) | [Cisco Config](../../raw/main/configs/cisco-s3-ca-west-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-ca-west-1.txt) |
| eu-central-1 | <img src="../../raw/main/images/flags/de.svg" width="25px"> Germany | Europe (Frankfurt) | [Cisco Config](../../raw/main/configs/cisco-s3-eu-central-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-eu-central-1.txt) |
| eu-central-2 | <img src="../../raw/main/images/flags/ch.svg" width="25px"> Switzerland | Europe (Zurich) | [Cisco Config](../../raw/main/configs/cisco-s3-eu-central-2.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-eu-central-2.txt) |
| eu-north-1 | <img src="../../raw/main/images/flags/se.svg" width="25px"> Sweden | Europe (Stockholm) | [Cisco Config](../../raw/main/configs/cisco-s3-eu-north-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-eu-north-1.txt) |
| eu-south-1 | <img src="../../raw/main/images/flags/it.svg" width="25px"> Italy | Europe (Milan) | [Cisco Config](../../raw/main/configs/cisco-s3-eu-south-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-eu-south-1.txt) |
| eu-south-2 | <img src="../../raw/main/images/flags/es.svg" width="25px"> Spain | Europe (Spain) | [Cisco Config](../../raw/main/configs/cisco-s3-eu-south-2.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-eu-south-2.txt) |
| eu-west-1 | <img src="../../raw/main/images/flags/ie.svg" width="25px"> Ireland | Europe (Ireland) | [Cisco Config](../../raw/main/configs/cisco-s3-eu-west-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-eu-west-1.txt) |
| eu-west-2 | <img src="../../raw/main/images/flags/gb.svg" width="25px"> United Kingdom | Europe (London) | [Cisco Config](../../raw/main/configs/cisco-s3-eu-west-2.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-eu-west-2.txt) |
| eu-west-3 | <img src="../../raw/main/images/flags/fr.svg" width="25px"> France | Europe (Paris) | [Cisco Config](../../raw/main/configs/cisco-s3-eu-west-3.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-eu-west-3.txt) |
| eusc-de-east-1 | <img src="../../raw/main/images/flags/de.svg" width="25px"> Germany | Europe Sovereign Cloud (Germany) | [Cisco Config](../../raw/main/configs/cisco-s3-eusc-de-east-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-eusc-de-east-1.txt) |
| il-central-1 | <img src="../../raw/main/images/flags/il.svg" width="25px"> Israel | Israel (Tel Aviv) | [Cisco Config](../../raw/main/configs/cisco-s3-il-central-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-il-central-1.txt) |
| me-central-1 | <img src="../../raw/main/images/flags/ae.svg" width="25px"> UAE | Middle East (UAE) | [Cisco Config](../../raw/main/configs/cisco-s3-me-central-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-me-central-1.txt) |
| me-south-1 | <img src="../../raw/main/images/flags/bh.svg" width="25px"> Bahrain | Middle East (Bahrain) | [Cisco Config](../../raw/main/configs/cisco-s3-me-south-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-me-south-1.txt) |
| me-west-1 | <img src="../../raw/main/images/flags/il.svg" width="25px"> Israel | Middle East (Tel Aviv) | [Cisco Config](../../raw/main/configs/cisco-s3-me-west-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-me-west-1.txt) |
| mx-central-1 | <img src="../../raw/main/images/flags/mx.svg" width="25px"> Mexico | Mexico (Central) | [Cisco Config](../../raw/main/configs/cisco-s3-mx-central-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-mx-central-1.txt) |
| sa-east-1 | <img src="../../raw/main/images/flags/br.svg" width="25px"> Brazil | South America (São Paulo) | [Cisco Config](../../raw/main/configs/cisco-s3-sa-east-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-sa-east-1.txt) |
| sa-west-1 | <img src="../../raw/main/images/flags/cl.svg" width="25px"> Chile | South America (Santiago) | [Cisco Config](../../raw/main/configs/cisco-s3-sa-west-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-sa-west-1.txt) |
| us-east-1 | <img src="../../raw/main/images/flags/us.svg" width="25px"> USA | US East (N. Virginia) | [Cisco Config](../../raw/main/configs/cisco-s3-us-east-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-us-east-1.txt) |
| us-east-2 | <img src="../../raw/main/images/flags/us.svg" width="25px"> USA | US East (Ohio) | [Cisco Config](../../raw/main/configs/cisco-s3-us-east-2.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-us-east-2.txt) |
| us-gov-east-1 | <img src="../../raw/main/images/flags/us.svg" width="25px"> USA | AWS GovCloud (US-East) | [Cisco Config](../../raw/main/configs/cisco-s3-us-gov-east-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-us-gov-east-1.txt) |
| us-gov-west-1 | <img src="../../raw/main/images/flags/us.svg" width="25px"> USA | AWS GovCloud (US-West) | [Cisco Config](../../raw/main/configs/cisco-s3-us-gov-west-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-us-gov-west-1.txt) |
| us-south-1 | <img src="../../raw/main/images/flags/us.svg" width="25px"> USA | US South (Texas) | [Cisco Config](../../raw/main/configs/cisco-s3-us-south-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-us-south-1.txt) |
| us-west-1 | <img src="../../raw/main/images/flags/us.svg" width="25px"> USA | US West (N. California) | [Cisco Config](../../raw/main/configs/cisco-s3-us-west-1.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-us-west-1.txt) |
| us-west-2 | <img src="../../raw/main/images/flags/us.svg" width="25px"> USA | US West (Oregon) | [Cisco Config](../../raw/main/configs/cisco-s3-us-west-2.txt) | [Juniper Config](../../raw/main/configs/juniper-s3-us-west-2.txt) |

## Usage

### Cisco IOS

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

## Automation

This repository is automatically updated via GitHub Actions when AWS publishes changes to ip-ranges.json.

### Setting up the Lambda Webhook

To automatically trigger updates when AWS publishes a new ip-ranges.json file:

1. Subscribe an AWS Lambda function to the SNS topic `arn:aws:sns:us-east-1:806199016981:AmazonIpSpaceChanged`

2. Use the Lambda function code from `lambda-webhook-trigger.js` in this repository

3. Configure the following environment variables in your Lambda function:
   - `GITHUB_OWNER` - Your GitHub username (e.g., `chriselsen`)
   - `GITHUB_TOKEN` - GitHub Personal Access Token with `repo` scope
   - `GITHUB_REPOS` - Comma-separated list of repositories (e.g., `s3-only-pubvif,AWS-Geofeed`)

4. Create a GitHub Personal Access Token:
   - Go to GitHub Settings → Developer settings → Personal access tokens → Tokens (classic)
   - Generate new token with `repo` scope
   - Store securely in Lambda environment variables

### Testing the Webhook

To manually trigger the workflow for testing:

```bash
curl -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer YOUR_GITHUB_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/OWNER/s3-only-pubvif/dispatches \
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
3. **RSS feed**: Subscribe to the commits feed: `https://github.com/OWNER/s3-only-pubvif/commits/main.atom`

## Notes

- Excludes China regions (cn-north-1, cn-northwest-1)
- IPv4 prefixes use 'le 24' to match more specific BGP announcements
- IPv6 prefixes use 'le 48' to match more specific BGP announcements
- Config files are only updated when actual IP ranges change

## Additional Considerations

While the prefix filters above reduce the number of routes received from AWS, you should also consider limiting the prefixes announced from your network to AWS.

Currently, AWS does not support filtering return traffic to only S3. Any prefixes you announce via the Direct Connect Public VIF will be reachable from all AWS services, not just S3. This means that even if you only accept S3 routes from AWS, traffic from EC2 and other services can still reach your network via Direct Connect.

**Recommended approach:** Announce only a /32 IPv4 prefix (single IP address) to AWS and use NAT/PAT (Port Address Translation) on your router to access S3. This minimizes your exposure while still allowing S3 traffic over Direct Connect.

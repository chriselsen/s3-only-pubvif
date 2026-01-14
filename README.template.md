# S3-only Public VIF Prefix Lists

This repository contains BGP prefix lists for filtering S3 traffic over AWS Direct Connect Public VIF.

## Why?

To use S3 with Direct Connect, customers often use a Public VIF. By filtering to only S3 prefixes for specific regions, you can limit the scope of routes received from AWS (AS16509).

## Architecture

```
┌─────────────────┐                                    ┌─────────────────┐
│                 │                                    │                 │
│  Customer       │                                    │      AWS        │
│  Network        │                                    │                 │
│  ┌──────────┐   │                                    │   ┌──────────┐  │
│  │  Router  │   │    Direct Connect Public VIF      │   │    S3    │  │
│  │  (with   │───┼───────────────────────────────────>│   │ (Region) │  │
│  │ filters) │   │    ✓ S3 prefixes only (filtered)  │   └──────────┘  │
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

| Region | Country | Region Name | Cisco IOS | Juniper |
| --- | --- | --- | --- | --- |
{{REGION_TABLE}}

## Usage

### Cisco IOS

```
ip prefix-list aws-s3-<region> seq <N> permit <prefix> le 24
ipv6 prefix-list aws-s3-<region> seq <N> permit <prefix> le 48
```

### Juniper

```
policy-options {
    prefix-list aws-s3-<region> {
        <prefix> orlonger;
    }
}
```

## Automation

This repository is automatically updated via GitHub Actions when AWS publishes changes to ip-ranges.json.

## Notes

- Excludes China regions (cn-north-1, cn-northwest-1)
- IPv4 prefixes use 'le 24' to match more specific BGP announcements
- IPv6 prefixes use 'le 48' to match more specific BGP announcements
- Config files are only updated when actual IP ranges change

## Additional Considerations

While the prefix filters above reduce the number of routes received from AWS, you should also consider limiting the prefixes announced from your network to AWS.

Currently, AWS does not support filtering return traffic to only S3. Any prefixes you announce via the Direct Connect Public VIF will be reachable from all AWS services, not just S3. This means that even if you only accept S3 routes from AWS, traffic from EC2 and other services can still reach your network via Direct Connect.

**Recommended approach:** Announce only a /32 IPv4 prefix (single IP address) to AWS and use NAT/PAT (Port Address Translation) on your router to access S3. This minimizes your exposure while still allowing S3 traffic over Direct Connect.

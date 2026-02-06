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

Last updated: 2026-02-06 19:27:50 UTC

### Per-Region Configs

| Region | Country | Region Name | Cisco IOS | Juniper | Arista EOS | Nokia SR OS | Mikrotik |
| --- | --- | --- | --- | --- | --- | --- | --- |
| af-south-1 | <img src="../../raw/main/images/flags/za.svg" width="25px"> South Africa | Africa (Cape Town) | [Cisco IOS](../../raw/main/configs/cisco-s3-af-south-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-af-south-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-af-south-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-af-south-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-af-south-1.rsc) |
| ap-east-1 | <img src="../../raw/main/images/flags/hk.svg" width="25px"> Hong Kong | Asia Pacific (Hong Kong) | [Cisco IOS](../../raw/main/configs/cisco-s3-ap-east-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-ap-east-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-ap-east-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-ap-east-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-ap-east-1.rsc) |
| ap-east-2 | <img src="../../raw/main/images/flags/tw.svg" width="25px"> Taiwan | Asia Pacific (Taipei) | [Cisco IOS](../../raw/main/configs/cisco-s3-ap-east-2.txt) | [Juniper](../../raw/main/configs/juniper-s3-ap-east-2.txt) | [Arista EOS](../../raw/main/configs/arista-s3-ap-east-2.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-ap-east-2.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-ap-east-2.rsc) |
| ap-northeast-1 | <img src="../../raw/main/images/flags/jp.svg" width="25px"> Japan | Asia Pacific (Tokyo) | [Cisco IOS](../../raw/main/configs/cisco-s3-ap-northeast-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-ap-northeast-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-ap-northeast-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-ap-northeast-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-ap-northeast-1.rsc) |
| ap-northeast-2 | <img src="../../raw/main/images/flags/kr.svg" width="25px"> South Korea | Asia Pacific (Seoul) | [Cisco IOS](../../raw/main/configs/cisco-s3-ap-northeast-2.txt) | [Juniper](../../raw/main/configs/juniper-s3-ap-northeast-2.txt) | [Arista EOS](../../raw/main/configs/arista-s3-ap-northeast-2.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-ap-northeast-2.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-ap-northeast-2.rsc) |
| ap-northeast-3 | <img src="../../raw/main/images/flags/jp.svg" width="25px"> Japan | Asia Pacific (Osaka) | [Cisco IOS](../../raw/main/configs/cisco-s3-ap-northeast-3.txt) | [Juniper](../../raw/main/configs/juniper-s3-ap-northeast-3.txt) | [Arista EOS](../../raw/main/configs/arista-s3-ap-northeast-3.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-ap-northeast-3.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-ap-northeast-3.rsc) |
| ap-south-1 | <img src="../../raw/main/images/flags/in.svg" width="25px"> India | Asia Pacific (Mumbai) | [Cisco IOS](../../raw/main/configs/cisco-s3-ap-south-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-ap-south-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-ap-south-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-ap-south-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-ap-south-1.rsc) |
| ap-south-2 | <img src="../../raw/main/images/flags/in.svg" width="25px"> India | Asia Pacific (Hyderabad) | [Cisco IOS](../../raw/main/configs/cisco-s3-ap-south-2.txt) | [Juniper](../../raw/main/configs/juniper-s3-ap-south-2.txt) | [Arista EOS](../../raw/main/configs/arista-s3-ap-south-2.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-ap-south-2.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-ap-south-2.rsc) |
| ap-southeast-1 | <img src="../../raw/main/images/flags/sg.svg" width="25px"> Singapore | Asia Pacific (Singapore) | [Cisco IOS](../../raw/main/configs/cisco-s3-ap-southeast-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-ap-southeast-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-ap-southeast-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-ap-southeast-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-ap-southeast-1.rsc) |
| ap-southeast-2 | <img src="../../raw/main/images/flags/au.svg" width="25px"> Australia | Asia Pacific (Sydney) | [Cisco IOS](../../raw/main/configs/cisco-s3-ap-southeast-2.txt) | [Juniper](../../raw/main/configs/juniper-s3-ap-southeast-2.txt) | [Arista EOS](../../raw/main/configs/arista-s3-ap-southeast-2.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-ap-southeast-2.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-ap-southeast-2.rsc) |
| ap-southeast-3 | <img src="../../raw/main/images/flags/id.svg" width="25px"> Indonesia | Asia Pacific (Jakarta) | [Cisco IOS](../../raw/main/configs/cisco-s3-ap-southeast-3.txt) | [Juniper](../../raw/main/configs/juniper-s3-ap-southeast-3.txt) | [Arista EOS](../../raw/main/configs/arista-s3-ap-southeast-3.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-ap-southeast-3.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-ap-southeast-3.rsc) |
| ap-southeast-4 | <img src="../../raw/main/images/flags/au.svg" width="25px"> Australia | Asia Pacific (Melbourne) | [Cisco IOS](../../raw/main/configs/cisco-s3-ap-southeast-4.txt) | [Juniper](../../raw/main/configs/juniper-s3-ap-southeast-4.txt) | [Arista EOS](../../raw/main/configs/arista-s3-ap-southeast-4.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-ap-southeast-4.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-ap-southeast-4.rsc) |
| ap-southeast-5 | <img src="../../raw/main/images/flags/my.svg" width="25px"> Malaysia | Asia Pacific (Kuala Lumpur) | [Cisco IOS](../../raw/main/configs/cisco-s3-ap-southeast-5.txt) | [Juniper](../../raw/main/configs/juniper-s3-ap-southeast-5.txt) | [Arista EOS](../../raw/main/configs/arista-s3-ap-southeast-5.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-ap-southeast-5.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-ap-southeast-5.rsc) |
| ap-southeast-6 | <img src="../../raw/main/images/flags/nz.svg" width="25px"> New Zealand | Asia Pacific (Auckland) | [Cisco IOS](../../raw/main/configs/cisco-s3-ap-southeast-6.txt) | [Juniper](../../raw/main/configs/juniper-s3-ap-southeast-6.txt) | [Arista EOS](../../raw/main/configs/arista-s3-ap-southeast-6.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-ap-southeast-6.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-ap-southeast-6.rsc) |
| ap-southeast-7 | <img src="../../raw/main/images/flags/th.svg" width="25px"> Thailand | Asia Pacific (Bangkok) | [Cisco IOS](../../raw/main/configs/cisco-s3-ap-southeast-7.txt) | [Juniper](../../raw/main/configs/juniper-s3-ap-southeast-7.txt) | [Arista EOS](../../raw/main/configs/arista-s3-ap-southeast-7.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-ap-southeast-7.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-ap-southeast-7.rsc) |
| ca-central-1 | <img src="../../raw/main/images/flags/ca.svg" width="25px"> Canada | Canada (Central) | [Cisco IOS](../../raw/main/configs/cisco-s3-ca-central-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-ca-central-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-ca-central-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-ca-central-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-ca-central-1.rsc) |
| ca-west-1 | <img src="../../raw/main/images/flags/ca.svg" width="25px"> Canada | Canada (West) | [Cisco IOS](../../raw/main/configs/cisco-s3-ca-west-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-ca-west-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-ca-west-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-ca-west-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-ca-west-1.rsc) |
| eu-central-1 | <img src="../../raw/main/images/flags/de.svg" width="25px"> Germany | Europe (Frankfurt) | [Cisco IOS](../../raw/main/configs/cisco-s3-eu-central-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-eu-central-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-eu-central-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-eu-central-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-eu-central-1.rsc) |
| eu-central-2 | <img src="../../raw/main/images/flags/ch.svg" width="25px"> Switzerland | Europe (Zurich) | [Cisco IOS](../../raw/main/configs/cisco-s3-eu-central-2.txt) | [Juniper](../../raw/main/configs/juniper-s3-eu-central-2.txt) | [Arista EOS](../../raw/main/configs/arista-s3-eu-central-2.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-eu-central-2.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-eu-central-2.rsc) |
| eu-north-1 | <img src="../../raw/main/images/flags/se.svg" width="25px"> Sweden | Europe (Stockholm) | [Cisco IOS](../../raw/main/configs/cisco-s3-eu-north-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-eu-north-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-eu-north-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-eu-north-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-eu-north-1.rsc) |
| eu-south-1 | <img src="../../raw/main/images/flags/it.svg" width="25px"> Italy | Europe (Milan) | [Cisco IOS](../../raw/main/configs/cisco-s3-eu-south-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-eu-south-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-eu-south-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-eu-south-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-eu-south-1.rsc) |
| eu-south-2 | <img src="../../raw/main/images/flags/es.svg" width="25px"> Spain | Europe (Spain) | [Cisco IOS](../../raw/main/configs/cisco-s3-eu-south-2.txt) | [Juniper](../../raw/main/configs/juniper-s3-eu-south-2.txt) | [Arista EOS](../../raw/main/configs/arista-s3-eu-south-2.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-eu-south-2.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-eu-south-2.rsc) |
| eu-west-1 | <img src="../../raw/main/images/flags/ie.svg" width="25px"> Ireland | Europe (Ireland) | [Cisco IOS](../../raw/main/configs/cisco-s3-eu-west-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-eu-west-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-eu-west-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-eu-west-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-eu-west-1.rsc) |
| eu-west-2 | <img src="../../raw/main/images/flags/gb.svg" width="25px"> United Kingdom | Europe (London) | [Cisco IOS](../../raw/main/configs/cisco-s3-eu-west-2.txt) | [Juniper](../../raw/main/configs/juniper-s3-eu-west-2.txt) | [Arista EOS](../../raw/main/configs/arista-s3-eu-west-2.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-eu-west-2.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-eu-west-2.rsc) |
| eu-west-3 | <img src="../../raw/main/images/flags/fr.svg" width="25px"> France | Europe (Paris) | [Cisco IOS](../../raw/main/configs/cisco-s3-eu-west-3.txt) | [Juniper](../../raw/main/configs/juniper-s3-eu-west-3.txt) | [Arista EOS](../../raw/main/configs/arista-s3-eu-west-3.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-eu-west-3.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-eu-west-3.rsc) |
| eusc-de-east-1 | <img src="../../raw/main/images/flags/de.svg" width="25px"> Germany | Europe Sovereign Cloud (Germany) | [Cisco IOS](../../raw/main/configs/cisco-s3-eusc-de-east-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-eusc-de-east-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-eusc-de-east-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-eusc-de-east-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-eusc-de-east-1.rsc) |
| il-central-1 | <img src="../../raw/main/images/flags/il.svg" width="25px"> Israel | Israel (Tel Aviv) | [Cisco IOS](../../raw/main/configs/cisco-s3-il-central-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-il-central-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-il-central-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-il-central-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-il-central-1.rsc) |
| me-central-1 | <img src="../../raw/main/images/flags/ae.svg" width="25px"> UAE | Middle East (UAE) | [Cisco IOS](../../raw/main/configs/cisco-s3-me-central-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-me-central-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-me-central-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-me-central-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-me-central-1.rsc) |
| me-south-1 | <img src="../../raw/main/images/flags/bh.svg" width="25px"> Bahrain | Middle East (Bahrain) | [Cisco IOS](../../raw/main/configs/cisco-s3-me-south-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-me-south-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-me-south-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-me-south-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-me-south-1.rsc) |
| me-west-1 | <img src="../../raw/main/images/flags/il.svg" width="25px"> Israel | Middle East (Tel Aviv) | [Cisco IOS](../../raw/main/configs/cisco-s3-me-west-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-me-west-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-me-west-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-me-west-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-me-west-1.rsc) |
| mx-central-1 | <img src="../../raw/main/images/flags/mx.svg" width="25px"> Mexico | Mexico (Central) | [Cisco IOS](../../raw/main/configs/cisco-s3-mx-central-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-mx-central-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-mx-central-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-mx-central-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-mx-central-1.rsc) |
| sa-east-1 | <img src="../../raw/main/images/flags/br.svg" width="25px"> Brazil | South America (São Paulo) | [Cisco IOS](../../raw/main/configs/cisco-s3-sa-east-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-sa-east-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-sa-east-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-sa-east-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-sa-east-1.rsc) |
| sa-west-1 | <img src="../../raw/main/images/flags/cl.svg" width="25px"> Chile | South America (Santiago) | [Cisco IOS](../../raw/main/configs/cisco-s3-sa-west-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-sa-west-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-sa-west-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-sa-west-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-sa-west-1.rsc) |
| us-east-1 | <img src="../../raw/main/images/flags/us.svg" width="25px"> USA | US East (N. Virginia) | [Cisco IOS](../../raw/main/configs/cisco-s3-us-east-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-us-east-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-us-east-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-us-east-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-us-east-1.rsc) |
| us-east-2 | <img src="../../raw/main/images/flags/us.svg" width="25px"> USA | US East (Ohio) | [Cisco IOS](../../raw/main/configs/cisco-s3-us-east-2.txt) | [Juniper](../../raw/main/configs/juniper-s3-us-east-2.txt) | [Arista EOS](../../raw/main/configs/arista-s3-us-east-2.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-us-east-2.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-us-east-2.rsc) |
| us-gov-east-1 | <img src="../../raw/main/images/flags/us.svg" width="25px"> USA | AWS GovCloud (US-East) | [Cisco IOS](../../raw/main/configs/cisco-s3-us-gov-east-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-us-gov-east-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-us-gov-east-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-us-gov-east-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-us-gov-east-1.rsc) |
| us-gov-west-1 | <img src="../../raw/main/images/flags/us.svg" width="25px"> USA | AWS GovCloud (US-West) | [Cisco IOS](../../raw/main/configs/cisco-s3-us-gov-west-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-us-gov-west-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-us-gov-west-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-us-gov-west-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-us-gov-west-1.rsc) |
| us-west-1 | <img src="../../raw/main/images/flags/us.svg" width="25px"> USA | US West (N. California) | [Cisco IOS](../../raw/main/configs/cisco-s3-us-west-1.txt) | [Juniper](../../raw/main/configs/juniper-s3-us-west-1.txt) | [Arista EOS](../../raw/main/configs/arista-s3-us-west-1.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-us-west-1.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-us-west-1.rsc) |
| us-west-2 | <img src="../../raw/main/images/flags/us.svg" width="25px"> USA | US West (Oregon) | [Cisco IOS](../../raw/main/configs/cisco-s3-us-west-2.txt) | [Juniper](../../raw/main/configs/juniper-s3-us-west-2.txt) | [Arista EOS](../../raw/main/configs/arista-s3-us-west-2.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-us-west-2.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-us-west-2.rsc) |

### Combined Region Configs

For convenience, combined configs aggregate prefixes from multiple regions:

| Group | Description | Cisco IOS | Juniper | Arista EOS | Nokia SR OS | Mikrotik |
| --- | --- | --- | --- | --- | --- | --- |
| ap-all | All Asia Pacific regions | [Cisco IOS](../../raw/main/configs/cisco-s3-ap-all.txt) | [Juniper](../../raw/main/configs/juniper-s3-ap-all.txt) | [Arista EOS](../../raw/main/configs/arista-s3-ap-all.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-ap-all.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-ap-all.rsc) |
| ap-northeast | AP Northeast regions | [Cisco IOS](../../raw/main/configs/cisco-s3-ap-northeast.txt) | [Juniper](../../raw/main/configs/juniper-s3-ap-northeast.txt) | [Arista EOS](../../raw/main/configs/arista-s3-ap-northeast.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-ap-northeast.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-ap-northeast.rsc) |
| ap-south | AP South regions | [Cisco IOS](../../raw/main/configs/cisco-s3-ap-south.txt) | [Juniper](../../raw/main/configs/juniper-s3-ap-south.txt) | [Arista EOS](../../raw/main/configs/arista-s3-ap-south.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-ap-south.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-ap-south.rsc) |
| ap-southeast | AP Southeast regions | [Cisco IOS](../../raw/main/configs/cisco-s3-ap-southeast.txt) | [Juniper](../../raw/main/configs/juniper-s3-ap-southeast.txt) | [Arista EOS](../../raw/main/configs/arista-s3-ap-southeast.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-ap-southeast.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-ap-southeast.rsc) |
| eu-all | All EU regions | [Cisco IOS](../../raw/main/configs/cisco-s3-eu-all.txt) | [Juniper](../../raw/main/configs/juniper-s3-eu-all.txt) | [Arista EOS](../../raw/main/configs/arista-s3-eu-all.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-eu-all.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-eu-all.rsc) |
| eu-central | EU Central regions | [Cisco IOS](../../raw/main/configs/cisco-s3-eu-central.txt) | [Juniper](../../raw/main/configs/juniper-s3-eu-central.txt) | [Arista EOS](../../raw/main/configs/arista-s3-eu-central.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-eu-central.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-eu-central.rsc) |
| eu-west | EU West regions | [Cisco IOS](../../raw/main/configs/cisco-s3-eu-west.txt) | [Juniper](../../raw/main/configs/juniper-s3-eu-west.txt) | [Arista EOS](../../raw/main/configs/arista-s3-eu-west.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-eu-west.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-eu-west.rsc) |
| us-all | All US regions (commercial) | [Cisco IOS](../../raw/main/configs/cisco-s3-us-all.txt) | [Juniper](../../raw/main/configs/juniper-s3-us-all.txt) | [Arista EOS](../../raw/main/configs/arista-s3-us-all.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-us-all.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-us-all.rsc) |
| us-east | US East regions | [Cisco IOS](../../raw/main/configs/cisco-s3-us-east.txt) | [Juniper](../../raw/main/configs/juniper-s3-us-east.txt) | [Arista EOS](../../raw/main/configs/arista-s3-us-east.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-us-east.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-us-east.rsc) |
| us-gov-all | All US GovCloud regions | [Cisco IOS](../../raw/main/configs/cisco-s3-us-gov-all.txt) | [Juniper](../../raw/main/configs/juniper-s3-us-gov-all.txt) | [Arista EOS](../../raw/main/configs/arista-s3-us-gov-all.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-us-gov-all.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-us-gov-all.rsc) |
| us-west | US West regions | [Cisco IOS](../../raw/main/configs/cisco-s3-us-west.txt) | [Juniper](../../raw/main/configs/juniper-s3-us-west.txt) | [Arista EOS](../../raw/main/configs/arista-s3-us-west.txt) | [Nokia SR OS](../../raw/main/configs/nokia-s3-us-west.txt) | [Mikrotik](../../raw/main/configs/mikrotik-s3-us-west.rsc) |

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
  https://api.github.com/repos/Specter099/s3-only-pubvif/dispatches \
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
3. **RSS feed**: Subscribe to the commits feed: `https://github.com/Specter099/s3-only-pubvif/commits/main.atom`

## Notes

- Excludes China regions (cn-north-1, cn-northwest-1)
- IPv4 prefixes use 'le 24' to match more specific BGP announcements
- IPv6 prefixes use 'le 48' to match more specific BGP announcements
- Config files are only updated when actual IP ranges change

## Additional Considerations

While the prefix filters above reduce the number of routes received from AWS, you should also consider limiting the prefixes announced from your network to AWS.

Currently, AWS does not support filtering return traffic to only S3. Any prefixes you announce via the Direct Connect Public VIF will be reachable from all AWS services, not just S3. This means that even if you only accept S3 routes from AWS, traffic from EC2 and other services can still reach your network via Direct Connect.

**Recommended approach:** Announce only a /32 IPv4 prefix (single IP address) to AWS and use NAT/PAT (Port Address Translation) on your router to access S3. This minimizes your exposure while still allowing S3 traffic over Direct Connect.

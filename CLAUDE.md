# CLAUDE.md

## Project Overview

This repository generates BGP prefix lists for filtering AWS S3 traffic over Direct Connect Public VIF. It allows network engineers to route only S3 traffic over Direct Connect while sending other AWS traffic over the Internet.

### How It Works

1. `generate-s3-prefix-lists.py` fetches AWS's `ip-ranges.json`
2. Extracts S3 prefixes for each region (excluding China)
3. Generates router config files for 5 vendors in `configs/`
4. Generates combined multi-region configs for convenience
5. Exports machine-readable data to `data/` (JSON/YAML)
6. Updates `README.md` from `README.template.md` with current data
7. GitHub Actions commits and pushes changes automatically

## File Structure

```
├── generate-s3-prefix-lists.py  # Source: Main generator script
├── README.template.md           # Source: Template for README generation
├── README.md                    # Generated: Auto-updated from template
├── configs/                     # Generated: Router config files
│   ├── cisco-s3-<region>.txt   # Cisco IOS prefix lists
│   ├── juniper-s3-<region>.txt # Juniper prefix lists
│   ├── arista-s3-<region>.txt  # Arista EOS prefix lists
│   ├── nokia-s3-<region>.txt   # Nokia SR OS prefix lists
│   ├── mikrotik-s3-<region>.rsc # Mikrotik RouterOS scripts
│   └── *-s3-<group>.*          # Combined region configs
├── data/                        # Generated: Machine-readable exports
│   ├── s3-prefixes.json        # JSON format
│   └── s3-prefixes.yaml        # YAML format
├── images/flags/               # Static: Country flag SVGs
├── .github/workflows/
│   └── generate-s3-prefix-lists.yml  # CI: Automation workflow
└── lambda-webhook-trigger.js   # Optional: Lambda for SNS triggers
```

### Source vs Generated

- **Source files** (edit these): `generate-s3-prefix-lists.py`, `README.template.md`, workflow YAML, Lambda
- **Generated files** (will be overwritten): `README.md`, everything in `configs/`, everything in `data/`

## Development

### Running Locally

```bash
# Normal run - generates all files
python generate-s3-prefix-lists.py

# Dry run - shows what would change without writing
python generate-s3-prefix-lists.py --dry-run
```

### CLI Options

- `--dry-run`: Preview changes without writing files

### Dependencies

- Python 3.10+
- No external packages required (uses stdlib only)

### Automation

The GitHub Actions workflow runs on:
- Push to `main`
- Manual trigger (`workflow_dispatch`)
- Webhook from AWS SNS via Lambda (`repository_dispatch`)

## Architecture Notes

### Prefix Filtering
- IPv4 prefixes use `le 24` to match more specific BGP announcements
- IPv6 prefixes use `le 48` for the same reason
- China regions (cn-north-1, cn-northwest-1) are excluded
- Config files only update when actual IP ranges change

### Supported Vendors
- **Cisco IOS**: Standard prefix-list syntax with sequence numbers
- **Juniper**: policy-options prefix-list with `orlonger`
- **Arista EOS**: Same syntax as Cisco IOS
- **Nokia SR OS**: MD-CLI format with `type longer`
- **Mikrotik RouterOS**: Firewall address-list format (.rsc scripts)

### Region Groups
Combined configs aggregate prefixes from multiple regions:
- `us-all`, `us-east`, `us-west`, `us-gov-all`
- `eu-all`, `eu-west`, `eu-central`
- `ap-all`, `ap-northeast`, `ap-southeast`, `ap-south`

### Lambda Webhook
- Uses AWS Secrets Manager for GitHub credentials
- Secret name configurable via `SECRET_NAME` env var
- Requires IAM permission: `secretsmanager:GetSecretValue`

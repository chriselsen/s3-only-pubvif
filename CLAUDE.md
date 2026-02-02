# CLAUDE.md

## Project Overview

This repository generates BGP prefix lists for filtering AWS S3 traffic over Direct Connect Public VIF. It allows network engineers to route only S3 traffic over Direct Connect while sending other AWS traffic over the Internet.

### How It Works

1. `generate-s3-prefix-lists.py` fetches AWS's `ip-ranges.json`
2. Extracts S3 prefixes for each region (excluding China)
3. Generates Cisco IOS and Juniper config files in `configs/`
4. Updates `README.md` from `README.template.md` with current data
5. GitHub Actions commits and pushes changes automatically

## File Structure

```
├── generate-s3-prefix-lists.py  # Source: Main generator script
├── README.template.md           # Source: Template for README generation
├── README.md                    # Generated: Auto-updated from template
├── configs/                     # Generated: Router config files
│   ├── cisco-s3-<region>.txt   # Cisco IOS prefix lists
│   └── juniper-s3-<region>.txt # Juniper prefix lists
├── images/flags/               # Static: Country flag SVGs
├── .github/workflows/
│   └── generate-s3-prefix-lists.yml  # CI: Automation workflow
└── lambda-webhook-trigger.js   # Optional: Lambda for SNS triggers
```

### Source vs Generated

- **Source files** (edit these): `generate-s3-prefix-lists.py`, `README.template.md`, workflow YAML
- **Generated files** (will be overwritten): `README.md`, everything in `configs/`

## Development

### Running Locally

```bash
python generate-s3-prefix-lists.py
```

This fetches the latest `ip-ranges.json` from AWS and regenerates all config files.

### Dependencies

- Python 3.10+
- No external packages required (uses stdlib `urllib` and `json`)

### Automation

The GitHub Actions workflow runs on:
- Push to `main`
- Manual trigger (`workflow_dispatch`)
- Webhook from AWS SNS via Lambda (`repository_dispatch`)

## Architecture Notes

- IPv4 prefixes use `le 24` to match more specific BGP announcements
- IPv6 prefixes use `le 48` for the same reason
- China regions (cn-north-1, cn-northwest-1) are excluded
- Config files only update when actual IP ranges change (git diff check in workflow)

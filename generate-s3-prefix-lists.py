#!/usr/bin/env python3

import argparse
import datetime
import json
import os
import subprocess
from pathlib import Path
from urllib.request import urlopen

# AWS ip-ranges.json URL
URL = 'https://ip-ranges.amazonaws.com/ip-ranges.json'

# Regions to exclude
EXCLUDE_REGIONS = ['cn-north-1', 'cn-northwest-1', 'GLOBAL']

# Region to country mapping
REGION_INFO = {
    'us-east-1': ('us', 'USA', 'US East (N. Virginia)'),
    'us-east-2': ('us', 'USA', 'US East (Ohio)'),
    'us-west-1': ('us', 'USA', 'US West (N. California)'),
    'us-west-2': ('us', 'USA', 'US West (Oregon)'),
    'us-gov-east-1': ('us', 'USA', 'AWS GovCloud (US-East)'),
    'us-gov-west-1': ('us', 'USA', 'AWS GovCloud (US-West)'),
    'ca-central-1': ('ca', 'Canada', 'Canada (Central)'),
    'ca-west-1': ('ca', 'Canada', 'Canada (West)'),
    'mx-central-1': ('mx', 'Mexico', 'Mexico (Central)'),
    'sa-east-1': ('br', 'Brazil', 'South America (São Paulo)'),
    'sa-west-1': ('cl', 'Chile', 'South America (Santiago)'),
    'eu-central-1': ('de', 'Germany', 'Europe (Frankfurt)'),
    'eu-central-2': ('ch', 'Switzerland', 'Europe (Zurich)'),
    'eu-north-1': ('se', 'Sweden', 'Europe (Stockholm)'),
    'eu-south-1': ('it', 'Italy', 'Europe (Milan)'),
    'eu-south-2': ('es', 'Spain', 'Europe (Spain)'),
    'eu-west-1': ('ie', 'Ireland', 'Europe (Ireland)'),
    'eu-west-2': ('gb', 'United Kingdom', 'Europe (London)'),
    'eu-west-3': ('fr', 'France', 'Europe (Paris)'),
    'eusc-de-east-1': ('de', 'Germany', 'Europe Sovereign Cloud (Germany)'),
    'il-central-1': ('il', 'Israel', 'Israel (Tel Aviv)'),
    'me-central-1': ('ae', 'UAE', 'Middle East (UAE)'),
    'me-south-1': ('bh', 'Bahrain', 'Middle East (Bahrain)'),
    'me-west-1': ('il', 'Israel', 'Middle East (Tel Aviv)'),
    'af-south-1': ('za', 'South Africa', 'Africa (Cape Town)'),
    'ap-northeast-1': ('jp', 'Japan', 'Asia Pacific (Tokyo)'),
    'ap-northeast-2': ('kr', 'South Korea', 'Asia Pacific (Seoul)'),
    'ap-northeast-3': ('jp', 'Japan', 'Asia Pacific (Osaka)'),
    'ap-east-1': ('hk', 'Hong Kong', 'Asia Pacific (Hong Kong)'),
    'ap-east-2': ('tw', 'Taiwan', 'Asia Pacific (Taipei)'),
    'ap-southeast-1': ('sg', 'Singapore', 'Asia Pacific (Singapore)'),
    'ap-southeast-2': ('au', 'Australia', 'Asia Pacific (Sydney)'),
    'ap-southeast-3': ('id', 'Indonesia', 'Asia Pacific (Jakarta)'),
    'ap-southeast-4': ('au', 'Australia', 'Asia Pacific (Melbourne)'),
    'ap-southeast-5': ('my', 'Malaysia', 'Asia Pacific (Kuala Lumpur)'),
    'ap-southeast-6': ('nz', 'New Zealand', 'Asia Pacific (Auckland)'),
    'ap-southeast-7': ('th', 'Thailand', 'Asia Pacific (Bangkok)'),
    'ap-south-1': ('in', 'India', 'Asia Pacific (Mumbai)'),
    'ap-south-2': ('in', 'India', 'Asia Pacific (Hyderabad)')
}

# Region groups for combined configs
REGION_GROUPS = {
    'us-all': ['us-east-1', 'us-east-2', 'us-west-1', 'us-west-2'],
    'us-gov-all': ['us-gov-east-1', 'us-gov-west-1'],
    'us-east': ['us-east-1', 'us-east-2'],
    'us-west': ['us-west-1', 'us-west-2'],
    'eu-all': ['eu-central-1', 'eu-central-2', 'eu-north-1', 'eu-south-1',
               'eu-south-2', 'eu-west-1', 'eu-west-2', 'eu-west-3'],
    'eu-west': ['eu-west-1', 'eu-west-2', 'eu-west-3'],
    'eu-central': ['eu-central-1', 'eu-central-2'],
    'ap-all': ['ap-northeast-1', 'ap-northeast-2', 'ap-northeast-3',
               'ap-east-1', 'ap-east-2', 'ap-southeast-1', 'ap-southeast-2',
               'ap-southeast-3', 'ap-southeast-4', 'ap-southeast-5',
               'ap-southeast-6', 'ap-southeast-7', 'ap-south-1', 'ap-south-2'],
    'ap-northeast': ['ap-northeast-1', 'ap-northeast-2', 'ap-northeast-3'],
    'ap-southeast': ['ap-southeast-1', 'ap-southeast-2', 'ap-southeast-3',
                     'ap-southeast-4', 'ap-southeast-5', 'ap-southeast-6',
                     'ap-southeast-7'],
    'ap-south': ['ap-south-1', 'ap-south-2'],
}

# Group descriptions for README
GROUP_INFO = {
    'us-all': 'All US regions (commercial)',
    'us-gov-all': 'All US GovCloud regions',
    'us-east': 'US East regions',
    'us-west': 'US West regions',
    'eu-all': 'All EU regions',
    'eu-west': 'EU West regions',
    'eu-central': 'EU Central regions',
    'ap-all': 'All Asia Pacific regions',
    'ap-northeast': 'AP Northeast regions',
    'ap-southeast': 'AP Southeast regions',
    'ap-south': 'AP South regions',
}


def parse_args():
    parser = argparse.ArgumentParser(
        description='Generate S3 prefix lists for BGP filtering on Direct Connect'
    )
    parser.add_argument(
        '--dry-run',
        action='store_true',
        help='Show what would change without writing files'
    )
    return parser.parse_args()


def write_file(filepath, content, dry_run=False):
    """Write content to file, or print what would be written in dry-run mode."""
    if dry_run:
        print(f"[DRY-RUN] Would write: {filepath}")
        return
    with open(filepath, 'w') as f:
        f.write(content)


def load_ip_ranges():
    response = urlopen(URL)
    return json.loads(response.read())


def extract_s3_prefixes(ipranges):
    s3_by_region = {}

    for prefix in ipranges['prefixes']:
        if prefix['service'] == 'S3' and prefix['region'] not in EXCLUDE_REGIONS:
            region = prefix['region']
            if region not in s3_by_region:
                s3_by_region[region] = {'ipv4': [], 'ipv6': []}
            s3_by_region[region]['ipv4'].append(prefix['ip_prefix'])

    for prefix in ipranges['ipv6_prefixes']:
        if prefix['service'] == 'S3' and prefix['region'] not in EXCLUDE_REGIONS:
            region = prefix['region']
            if region not in s3_by_region:
                s3_by_region[region] = {'ipv4': [], 'ipv6': []}
            s3_by_region[region]['ipv6'].append(prefix['ipv6_prefix'])

    return s3_by_region


def aggregate_region_prefixes(s3_by_region, region_list):
    """Combine prefixes from multiple regions, removing duplicates."""
    aggregated = {'ipv4': set(), 'ipv6': set()}

    for region in region_list:
        if region in s3_by_region:
            aggregated['ipv4'].update(s3_by_region[region]['ipv4'])
            aggregated['ipv6'].update(s3_by_region[region]['ipv6'])

    return {
        'ipv4': list(aggregated['ipv4']),
        'ipv6': list(aggregated['ipv6'])
    }


# --- Vendor Config Generators ---

def generate_cisco_config(region, prefixes, timestamp):
    """Generate Cisco IOS prefix list configuration."""
    lines = [f"! S3 prefix list for {region}", f"! Last updated: {timestamp}", "!"]

    seq = 10
    for ipv4 in sorted(prefixes['ipv4']):
        prefix_len = int(ipv4.split('/')[1])
        if prefix_len <= 24:
            lines.append(f"ip prefix-list aws-s3-{region} seq {seq} permit {ipv4} le 24")
            seq += 10

    for ipv6 in sorted(prefixes['ipv6']):
        prefix_len = int(ipv6.split('/')[1])
        if prefix_len <= 48:
            lines.append(f"ipv6 prefix-list aws-s3-{region} seq {seq} permit {ipv6} le 48")
            seq += 10

    return '\n'.join(lines) + '\n'


def generate_juniper_config(region, prefixes, timestamp):
    """Generate Juniper prefix list configuration."""
    lines = [f"/* S3 prefix list for {region} */", f"/* Last updated: {timestamp} */"]
    lines.append("policy-options {")
    lines.append(f"    prefix-list aws-s3-{region} {{")

    for ipv4 in sorted(prefixes['ipv4']):
        prefix_len = int(ipv4.split('/')[1])
        if prefix_len <= 24:
            lines.append(f"        {ipv4} orlonger;")

    for ipv6 in sorted(prefixes['ipv6']):
        prefix_len = int(ipv6.split('/')[1])
        if prefix_len <= 48:
            lines.append(f"        {ipv6} orlonger;")

    lines.append("    }")
    lines.append("}")

    return '\n'.join(lines) + '\n'


def generate_arista_config(region, prefixes, timestamp):
    """Generate Arista EOS prefix list configuration."""
    lines = [f"! S3 prefix list for {region}", f"! Last updated: {timestamp}", "!"]

    seq = 10
    for ipv4 in sorted(prefixes['ipv4']):
        prefix_len = int(ipv4.split('/')[1])
        if prefix_len <= 24:
            lines.append(f"ip prefix-list aws-s3-{region} seq {seq} permit {ipv4} le 24")
            seq += 10

    for ipv6 in sorted(prefixes['ipv6']):
        prefix_len = int(ipv6.split('/')[1])
        if prefix_len <= 48:
            lines.append(f"ipv6 prefix-list aws-s3-{region} seq {seq} permit {ipv6} le 48")
            seq += 10

    return '\n'.join(lines) + '\n'


def generate_nokia_config(region, prefixes, timestamp):
    """Generate Nokia SR OS prefix list configuration."""
    lines = [
        f"# S3 prefix list for {region}",
        f"# Last updated: {timestamp}",
        "",
        "/configure {",
        "    router Base {",
        "        policy-options {",
        f'            prefix-list "aws-s3-{region}" {{',
    ]

    for ipv4 in sorted(prefixes['ipv4']):
        prefix_len = int(ipv4.split('/')[1])
        if prefix_len <= 24:
            lines.append(f"                prefix {ipv4} type longer {{")
            lines.append("                }")

    for ipv6 in sorted(prefixes['ipv6']):
        prefix_len = int(ipv6.split('/')[1])
        if prefix_len <= 48:
            lines.append(f"                prefix {ipv6} type longer {{")
            lines.append("                }")

    lines.extend([
        "            }",
        "        }",
        "    }",
        "}"
    ])

    return '\n'.join(lines) + '\n'


def generate_mikrotik_config(region, prefixes, timestamp):
    """Generate Mikrotik RouterOS address list configuration."""
    lines = [
        f"# S3 prefix list for {region}",
        f"# Last updated: {timestamp}",
        "#",
        f"# Import with: /import file-name=mikrotik-s3-{region}.rsc",
        "",
    ]

    list_name = f"aws-s3-{region}"

    # Remove existing list entries first
    lines.append(f"/ip firewall address-list remove [find list={list_name}]")
    lines.append(f"/ipv6 firewall address-list remove [find list={list_name}]")
    lines.append("")

    for ipv4 in sorted(prefixes['ipv4']):
        prefix_len = int(ipv4.split('/')[1])
        if prefix_len <= 24:
            lines.append(f"/ip firewall address-list add list={list_name} address={ipv4}")

    for ipv6 in sorted(prefixes['ipv6']):
        prefix_len = int(ipv6.split('/')[1])
        if prefix_len <= 48:
            lines.append(f"/ipv6 firewall address-list add list={list_name} address={ipv6}")

    return '\n'.join(lines) + '\n'


# Vendor registry
VENDORS = {
    'cisco': {
        'generator': generate_cisco_config,
        'comment_chars': ('!',),
        'extension': 'txt',
        'name': 'Cisco IOS'
    },
    'juniper': {
        'generator': generate_juniper_config,
        'comment_chars': ('/*', '*/'),
        'extension': 'txt',
        'name': 'Juniper'
    },
    'arista': {
        'generator': generate_arista_config,
        'comment_chars': ('!',),
        'extension': 'txt',
        'name': 'Arista EOS'
    },
    'nokia': {
        'generator': generate_nokia_config,
        'comment_chars': ('#',),
        'extension': 'txt',
        'name': 'Nokia SR OS'
    },
    'mikrotik': {
        'generator': generate_mikrotik_config,
        'comment_chars': ('#',),
        'extension': 'rsc',
        'name': 'Mikrotik'
    }
}


def load_existing_config(filepath, comment_chars):
    """Load existing config and extract content lines for comparison."""
    if os.path.exists(filepath):
        with open(filepath, 'r') as f:
            content = f.read()
            lines = []
            for line in content.split('\n'):
                stripped = line.strip()
                if not stripped:
                    continue
                # Skip comment lines
                if any(stripped.startswith(c) for c in comment_chars):
                    continue
                # Skip closing braces (for Juniper/Nokia)
                if stripped == '}':
                    continue
                # Skip timestamp lines
                if 'Last updated' in stripped:
                    continue
                lines.append(stripped)
            return '\n'.join(lines)
    return None


def extract_content_lines(config, comment_chars):
    """Extract content lines from a config string for comparison."""
    lines = []
    for line in config.split('\n'):
        stripped = line.strip()
        if not stripped:
            continue
        if any(stripped.startswith(c) for c in comment_chars):
            continue
        if stripped == '}':
            continue
        if 'Last updated' in stripped:
            continue
        lines.append(stripped)
    return '\n'.join(lines)


# --- Data Export Functions ---

def generate_yaml(data, indent=0):
    """Generate YAML string from dict/list without external dependencies."""
    yaml_lines = []
    prefix = '  ' * indent

    if isinstance(data, dict):
        for key, value in data.items():
            if isinstance(value, dict) and value:
                yaml_lines.append(f"{prefix}{key}:")
                yaml_lines.append(generate_yaml(value, indent + 1))
            elif isinstance(value, list):
                if not value:
                    yaml_lines.append(f"{prefix}{key}: []")
                elif isinstance(value[0], dict):
                    yaml_lines.append(f"{prefix}{key}:")
                    for item in value:
                        yaml_lines.append(f"{prefix}  -")
                        yaml_lines.append(generate_yaml(item, indent + 2))
                else:
                    yaml_lines.append(f"{prefix}{key}:")
                    for item in value:
                        yaml_lines.append(f"{prefix}  - \"{item}\"")
            elif isinstance(value, str):
                yaml_lines.append(f"{prefix}{key}: \"{value}\"")
            elif isinstance(value, bool):
                yaml_lines.append(f"{prefix}{key}: {str(value).lower()}")
            else:
                yaml_lines.append(f"{prefix}{key}: {value}")

    return '\n'.join(yaml_lines)


def export_data_formats(s3_by_region, timestamp, dry_run=False):
    """Export prefix data to JSON and YAML formats."""
    Path('./data').mkdir(exist_ok=True)

    # Build structured data
    export_data = {
        'metadata': {
            'generated_at': timestamp,
            'source': 'https://ip-ranges.amazonaws.com/ip-ranges.json',
            'excluded_regions': EXCLUDE_REGIONS
        },
        'regions': {}
    }

    for region in sorted(s3_by_region.keys()):
        prefixes = s3_by_region[region]
        region_info = REGION_INFO.get(region, ('xx', 'Unknown', region))
        export_data['regions'][region] = {
            'country_code': region_info[0],
            'country_name': region_info[1],
            'region_name': region_info[2],
            'ipv4_prefixes': sorted(prefixes['ipv4']),
            'ipv6_prefixes': sorted(prefixes['ipv6']),
            'ipv4_count': len(prefixes['ipv4']),
            'ipv6_count': len(prefixes['ipv6'])
        }

    # JSON export
    json_path = './data/s3-prefixes.json'
    json_content = json.dumps(export_data, indent=2) + '\n'
    write_file(json_path, json_content, dry_run)

    # YAML export
    yaml_path = './data/s3-prefixes.yaml'
    yaml_content = generate_yaml(export_data) + '\n'
    write_file(yaml_path, yaml_content, dry_run)

    if not dry_run:
        print(f"Exported data to {json_path} and {yaml_path}")


# --- README Generation ---

def get_repo_owner():
    """Detect repository owner from git remote or environment variable."""
    # Environment variable takes precedence
    if os.environ.get('GITHUB_OWNER'):
        return os.environ['GITHUB_OWNER']

    # Try to parse from git remote
    try:
        result = subprocess.run(
            ['git', 'remote', 'get-url', 'origin'],
            capture_output=True, text=True, timeout=5
        )
        if result.returncode == 0:
            url = result.stdout.strip()
            # Handle SSH format: git@github.com:owner/repo.git
            if url.startswith('git@'):
                parts = url.split(':')[1].split('/')
                return parts[0]
            # Handle HTTPS format: https://github.com/owner/repo.git
            elif 'github.com' in url:
                parts = url.replace('.git', '').split('/')
                for i, part in enumerate(parts):
                    if 'github.com' in part:
                        return parts[i + 1]
    except Exception:
        pass

    return 'OWNER'  # Fallback


def generate_readme(s3_by_region, timestamp, dry_run=False):
    """Generate README.md from template."""
    with open('./README.template.md', 'r') as f:
        template = f.read()

    # Generate region table rows
    region_rows = []
    for region in sorted(s3_by_region.keys()):
        country_code, country_name, region_name = REGION_INFO.get(region, ('xx', 'Unknown', region))
        flag = f'<img src="../../raw/main/images/flags/{country_code}.svg" width="25px"> {country_name}'

        links = []
        for vendor_key in ['cisco', 'juniper', 'arista', 'nokia', 'mikrotik']:
            vendor = VENDORS[vendor_key]
            ext = vendor['extension']
            links.append(f"[{vendor['name']}](../../raw/main/configs/{vendor_key}-s3-{region}.{ext})")

        region_rows.append(f"| {region} | {flag} | {region_name} | {' | '.join(links)} |")

    # Generate group table rows
    group_rows = []
    for group_name in sorted(REGION_GROUPS.keys()):
        description = GROUP_INFO.get(group_name, group_name)
        regions_list = ', '.join(REGION_GROUPS[group_name])

        links = []
        for vendor_key in ['cisco', 'juniper', 'arista', 'nokia', 'mikrotik']:
            vendor = VENDORS[vendor_key]
            ext = vendor['extension']
            links.append(f"[{vendor['name']}](../../raw/main/configs/{vendor_key}-s3-{group_name}.{ext})")

        group_rows.append(f"| {group_name} | {description} | {' | '.join(links)} |")

    # Replace placeholders
    owner = get_repo_owner()
    readme = template.replace('{{TIMESTAMP}}', timestamp)
    readme = readme.replace('{{REGION_TABLE}}', '\n'.join(region_rows))
    readme = readme.replace('{{GROUP_TABLE}}', '\n'.join(group_rows))
    readme = readme.replace('{{OWNER}}', owner)

    write_file('./README.md', readme, dry_run)


# --- Main Function ---

def main():
    args = parse_args()
    timestamp = datetime.datetime.now(datetime.timezone.utc).strftime('%Y-%m-%d %H:%M:%S UTC')

    if args.dry_run:
        print(f"[DRY-RUN] Timestamp would be: {timestamp}")

    ipranges = load_ip_ranges()
    s3_by_region = extract_s3_prefixes(ipranges)

    if not args.dry_run:
        Path('./configs').mkdir(exist_ok=True)

    updated_configs = []

    # Generate per-region configs for all vendors
    for region in sorted(s3_by_region.keys()):
        prefixes = s3_by_region[region]

        for vendor_key, vendor in VENDORS.items():
            config = vendor['generator'](region, prefixes, timestamp)
            filepath = f"./configs/{vendor_key}-s3-{region}.{vendor['extension']}"

            existing = load_existing_config(filepath, vendor['comment_chars'])
            new_content = extract_content_lines(config, vendor['comment_chars'])

            if existing != new_content:
                write_file(filepath, config, args.dry_run)
                updated_configs.append(f"{region} ({vendor['name']})")

    # Generate combined region group configs
    for group_name, regions in REGION_GROUPS.items():
        combined_prefixes = aggregate_region_prefixes(s3_by_region, regions)

        if not combined_prefixes['ipv4'] and not combined_prefixes['ipv6']:
            continue

        for vendor_key, vendor in VENDORS.items():
            config = vendor['generator'](group_name, combined_prefixes, timestamp)
            filepath = f"./configs/{vendor_key}-s3-{group_name}.{vendor['extension']}"

            existing = load_existing_config(filepath, vendor['comment_chars'])
            new_content = extract_content_lines(config, vendor['comment_chars'])

            if existing != new_content:
                write_file(filepath, config, args.dry_run)
                updated_configs.append(f"{group_name} ({vendor['name']})")

    if updated_configs:
        print(f"Updated configs: {', '.join(updated_configs[:10])}" +
              (f" and {len(updated_configs) - 10} more..." if len(updated_configs) > 10 else ""))
        generate_readme(s3_by_region, timestamp, args.dry_run)
    else:
        print("No changes detected")

    # Always generate README if it doesn't exist
    if not os.path.exists('./README.md') and not args.dry_run:
        generate_readme(s3_by_region, timestamp, args.dry_run)

    # Export data formats
    export_data_formats(s3_by_region, timestamp, args.dry_run)


if __name__ == '__main__':
    main()

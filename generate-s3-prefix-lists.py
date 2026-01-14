#!/usr/bin/env python3

import json
import datetime
import os
from urllib.request import urlopen
from pathlib import Path

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

def generate_cisco_config(region, prefixes, timestamp):
    lines = [f"! S3 prefix list for {region}", f"! Last updated: {timestamp}", "!"]
    
    seq = 10
    for ipv4 in sorted(prefixes['ipv4']):
        lines.append(f"ip prefix-list aws-s3-{region} seq {seq} permit {ipv4} le 24")
        seq += 10
    
    for ipv6 in sorted(prefixes['ipv6']):
        lines.append(f"ipv6 prefix-list aws-s3-{region} seq {seq} permit {ipv6} le 48")
        seq += 10
    
    return '\n'.join(lines) + '\n'

def generate_juniper_config(region, prefixes, timestamp):
    lines = [f"/* S3 prefix list for {region} */", f"/* Last updated: {timestamp} */"]
    lines.append(f"policy-options {{")
    lines.append(f"    prefix-list aws-s3-{region} {{")
    
    for ipv4 in sorted(prefixes['ipv4']):
        lines.append(f"        {ipv4} orlonger;")
    
    for ipv6 in sorted(prefixes['ipv6']):
        lines.append(f"        {ipv6} orlonger;")
    
    lines.append("    }")
    lines.append("}")
    
    return '\n'.join(lines) + '\n'

def load_existing_config(filepath):
    if os.path.exists(filepath):
        with open(filepath, 'r') as f:
            content = f.read()
            # Extract just the prefix lines, excluding comments and timestamps
            lines = [line for line in content.split('\n')
                    if line.strip() and not line.strip().startswith(('!', '/*', '*/')) 
                    and not line.strip() == '}' and 'Last updated' not in line]
            return '\n'.join(lines)
    return None

def main():
    timestamp = datetime.datetime.now(datetime.timezone.utc).strftime('%Y-%m-%d %H:%M:%S UTC')
    
    ipranges = load_ip_ranges()
    s3_by_region = extract_s3_prefixes(ipranges)
    
    Path('./configs').mkdir(exist_ok=True)
    
    updated_regions = []
    
    for region in sorted(s3_by_region.keys()):
        prefixes = s3_by_region[region]
        
        # Generate Cisco config
        cisco_config = generate_cisco_config(region, prefixes, timestamp)
        cisco_path = f'./configs/cisco-s3-{region}.txt'
        cisco_existing = load_existing_config(cisco_path)
        
        cisco_new_content = '\n'.join([line for line in cisco_config.split('\n') 
                                               if line.strip() and not line.strip().startswith('!')])
        
        if cisco_existing != cisco_new_content:
            with open(cisco_path, 'w') as f:
                f.write(cisco_config)
            updated_regions.append(f'{region} (Cisco)')
        
        # Generate Juniper config
        juniper_config = generate_juniper_config(region, prefixes, timestamp)
        juniper_path = f'./configs/juniper-s3-{region}.txt'
        juniper_existing = load_existing_config(juniper_path)
        
        juniper_new_content = '\n'.join([line for line in juniper_config.split('\n') 
                                                 if line.strip() and not line.strip().startswith(('/*', '*/')) 
                                                 and not line.strip() == '}'])
        
        if juniper_existing != juniper_new_content:
            with open(juniper_path, 'w') as f:
                f.write(juniper_config)
            updated_regions.append(f'{region} (Juniper)')
    
    if updated_regions:
        print(f"Updated configs for: {', '.join(updated_regions)}")
        # Generate README when configs changed
        generate_readme(s3_by_region, timestamp)
    else:
        print("No changes detected")
    
    # Always generate README if it doesn't exist
    if not os.path.exists('./README.md'):
        generate_readme(s3_by_region, timestamp)

def generate_readme(s3_by_region, timestamp):
    with open('./README.template.md', 'r') as f:
        template = f.read()
    
    region_rows = []
    for region in sorted(s3_by_region.keys()):
        country_code, country_name, region_name = REGION_INFO.get(region, ('xx', 'Unknown', region))
        flag = f'<img src="../../raw/main/images/flags/{country_code}.svg" width="25px"> {country_name}'
        cisco_link = f"[Cisco Config](../../raw/main/configs/cisco-s3-{region}.txt)"
        juniper_link = f"[Juniper Config](../../raw/main/configs/juniper-s3-{region}.txt)"
        region_rows.append(f"| {region} | {flag} | {region_name} | {cisco_link} | {juniper_link} |")
    
    readme = template.replace('{{TIMESTAMP}}', timestamp)
    readme = readme.replace('{{REGION_TABLE}}', '\n'.join(region_rows))
    
    with open('./README.md', 'w') as f:
        f.write(readme)

if __name__ == '__main__':
    main()

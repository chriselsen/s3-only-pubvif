# S3 prefix list for me-south-1
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-me-south-1.rsc

/ip firewall address-list remove [find list=aws-s3-me-south-1]
/ipv6 firewall address-list remove [find list=aws-s3-me-south-1]

/ip firewall address-list add list=aws-s3-me-south-1 address=1.178.16.0/24
/ip firewall address-list add list=aws-s3-me-south-1 address=3.5.220.0/22
/ip firewall address-list add list=aws-s3-me-south-1 address=52.95.172.0/23
/ip firewall address-list add list=aws-s3-me-south-1 address=52.95.174.0/24
/ipv6 firewall address-list add list=aws-s3-me-south-1 address=2600:f0f1:86::/48
/ipv6 firewall address-list add list=aws-s3-me-south-1 address=2a05:d030:e000::/40
/ipv6 firewall address-list add list=aws-s3-me-south-1 address=2a05:d050:e000::/40
/ipv6 firewall address-list add list=aws-s3-me-south-1 address=2a05:d059:e000::/40
/ipv6 firewall address-list add list=aws-s3-me-south-1 address=2a05:d070:e000::/40
/ipv6 firewall address-list add list=aws-s3-me-south-1 address=2a05:d074:e000::/40
/ipv6 firewall address-list add list=aws-s3-me-south-1 address=2a05:d078:e000::/40
/ipv6 firewall address-list add list=aws-s3-me-south-1 address=2a05:d079:e000::/40
/ipv6 firewall address-list add list=aws-s3-me-south-1 address=2a05:d07a:e000::/40

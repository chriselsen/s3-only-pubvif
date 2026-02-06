# S3 prefix list for me-west-1
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-me-west-1.rsc

/ip firewall address-list remove [find list=aws-s3-me-west-1]
/ipv6 firewall address-list remove [find list=aws-s3-me-west-1]

/ip firewall address-list add list=aws-s3-me-west-1 address=16.12.84.0/23
/ip firewall address-list add list=aws-s3-me-west-1 address=16.12.86.0/24
/ip firewall address-list add list=aws-s3-me-west-1 address=16.15.16.0/22
/ipv6 firewall address-list add list=aws-s3-me-west-1 address=2a05:d030:800::/40
/ipv6 firewall address-list add list=aws-s3-me-west-1 address=2a05:d050:800::/40
/ipv6 firewall address-list add list=aws-s3-me-west-1 address=2a05:d059:800::/40
/ipv6 firewall address-list add list=aws-s3-me-west-1 address=2a05:d070:800::/40
/ipv6 firewall address-list add list=aws-s3-me-west-1 address=2a05:d074:800::/40
/ipv6 firewall address-list add list=aws-s3-me-west-1 address=2a05:d078:800::/40
/ipv6 firewall address-list add list=aws-s3-me-west-1 address=2a05:d079:800::/40

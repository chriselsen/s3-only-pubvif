# S3 prefix list for eu-west-1
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-eu-west-1.rsc

/ip firewall address-list remove [find list=aws-s3-eu-west-1]
/ipv6 firewall address-list remove [find list=aws-s3-eu-west-1]

/ip firewall address-list add list=aws-s3-eu-west-1 address=1.178.7.0/24
/ip firewall address-list add list=aws-s3-eu-west-1 address=3.5.64.0/21
/ip firewall address-list add list=aws-s3-eu-west-1 address=3.5.72.0/23
/ip firewall address-list add list=aws-s3-eu-west-1 address=3.5.74.0/23
/ip firewall address-list add list=aws-s3-eu-west-1 address=52.218.0.0/17
/ip firewall address-list add list=aws-s3-eu-west-1 address=52.92.0.0/17
/ipv6 firewall address-list add list=aws-s3-eu-west-1 address=2600:f0f2:7015::/48
/ipv6 firewall address-list add list=aws-s3-eu-west-1 address=2a05:d030:8000::/40
/ipv6 firewall address-list add list=aws-s3-eu-west-1 address=2a05:d050:8000::/40
/ipv6 firewall address-list add list=aws-s3-eu-west-1 address=2a05:d059:8000::/40
/ipv6 firewall address-list add list=aws-s3-eu-west-1 address=2a05:d070:8000::/40
/ipv6 firewall address-list add list=aws-s3-eu-west-1 address=2a05:d074:8000::/40
/ipv6 firewall address-list add list=aws-s3-eu-west-1 address=2a05:d078:8000::/40
/ipv6 firewall address-list add list=aws-s3-eu-west-1 address=2a05:d079:8000::/40
/ipv6 firewall address-list add list=aws-s3-eu-west-1 address=2a05:d07a:8000::/40

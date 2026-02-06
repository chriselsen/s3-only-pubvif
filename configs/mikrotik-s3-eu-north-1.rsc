# S3 prefix list for eu-north-1
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-eu-north-1.rsc

/ip firewall address-list remove [find list=aws-s3-eu-north-1]
/ipv6 firewall address-list remove [find list=aws-s3-eu-north-1]

/ip firewall address-list add list=aws-s3-eu-north-1 address=1.178.93.0/24
/ip firewall address-list add list=aws-s3-eu-north-1 address=16.12.10.0/23
/ip firewall address-list add list=aws-s3-eu-north-1 address=16.12.9.0/24
/ip firewall address-list add list=aws-s3-eu-north-1 address=3.5.216.0/22
/ip firewall address-list add list=aws-s3-eu-north-1 address=52.95.169.0/24
/ip firewall address-list add list=aws-s3-eu-north-1 address=52.95.170.0/23
/ipv6 firewall address-list add list=aws-s3-eu-north-1 address=2600:f0f2:701f::/48
/ipv6 firewall address-list add list=aws-s3-eu-north-1 address=2a05:d030:6000::/40
/ipv6 firewall address-list add list=aws-s3-eu-north-1 address=2a05:d050:6000::/40
/ipv6 firewall address-list add list=aws-s3-eu-north-1 address=2a05:d059:6000::/40
/ipv6 firewall address-list add list=aws-s3-eu-north-1 address=2a05:d070:6000::/40
/ipv6 firewall address-list add list=aws-s3-eu-north-1 address=2a05:d074:6000::/40
/ipv6 firewall address-list add list=aws-s3-eu-north-1 address=2a05:d078:6000::/40
/ipv6 firewall address-list add list=aws-s3-eu-north-1 address=2a05:d079:6000::/40
/ipv6 firewall address-list add list=aws-s3-eu-north-1 address=2a05:d07a:6000::/40

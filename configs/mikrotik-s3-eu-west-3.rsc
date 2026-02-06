# S3 prefix list for eu-west-3
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-eu-west-3.rsc

/ip firewall address-list remove [find list=aws-s3-eu-west-3]
/ipv6 firewall address-list remove [find list=aws-s3-eu-west-3]

/ip firewall address-list add list=aws-s3-eu-west-3 address=1.178.90.0/24
/ip firewall address-list add list=aws-s3-eu-west-3 address=16.12.18.0/23
/ip firewall address-list add list=aws-s3-eu-west-3 address=16.12.20.0/24
/ip firewall address-list add list=aws-s3-eu-west-3 address=3.5.204.0/22
/ip firewall address-list add list=aws-s3-eu-west-3 address=3.5.224.0/22
/ip firewall address-list add list=aws-s3-eu-west-3 address=52.95.154.0/23
/ip firewall address-list add list=aws-s3-eu-west-3 address=52.95.156.0/24
/ipv6 firewall address-list add list=aws-s3-eu-west-3 address=2600:f0f2:701c::/48
/ipv6 firewall address-list add list=aws-s3-eu-west-3 address=2a05:d030:2000::/40
/ipv6 firewall address-list add list=aws-s3-eu-west-3 address=2a05:d050:2000::/40
/ipv6 firewall address-list add list=aws-s3-eu-west-3 address=2a05:d059:2000::/40
/ipv6 firewall address-list add list=aws-s3-eu-west-3 address=2a05:d070:2000::/40
/ipv6 firewall address-list add list=aws-s3-eu-west-3 address=2a05:d074:2000::/40
/ipv6 firewall address-list add list=aws-s3-eu-west-3 address=2a05:d078:2000::/40
/ipv6 firewall address-list add list=aws-s3-eu-west-3 address=2a05:d079:2000::/40
/ipv6 firewall address-list add list=aws-s3-eu-west-3 address=2a05:d07a:2000::/40

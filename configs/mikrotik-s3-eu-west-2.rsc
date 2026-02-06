# S3 prefix list for eu-west-2
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-eu-west-2.rsc

/ip firewall address-list remove [find list=aws-s3-eu-west-2]
/ipv6 firewall address-list remove [find list=aws-s3-eu-west-2]

/ip firewall address-list add list=aws-s3-eu-west-2 address=1.178.94.0/24
/ip firewall address-list add list=aws-s3-eu-west-2 address=16.12.15.0/24
/ip firewall address-list add list=aws-s3-eu-west-2 address=16.12.16.0/23
/ip firewall address-list add list=aws-s3-eu-west-2 address=3.5.244.0/22
/ip firewall address-list add list=aws-s3-eu-west-2 address=52.219.219.0/24
/ip firewall address-list add list=aws-s3-eu-west-2 address=52.95.142.0/23
/ip firewall address-list add list=aws-s3-eu-west-2 address=52.95.144.0/24
/ip firewall address-list add list=aws-s3-eu-west-2 address=52.95.148.0/23
/ip firewall address-list add list=aws-s3-eu-west-2 address=52.95.150.0/24
/ip firewall address-list add list=aws-s3-eu-west-2 address=52.95.191.0/24
/ipv6 firewall address-list add list=aws-s3-eu-west-2 address=2600:f0f1:80::/48
/ipv6 firewall address-list add list=aws-s3-eu-west-2 address=2a05:d030:c000::/40
/ipv6 firewall address-list add list=aws-s3-eu-west-2 address=2a05:d050:c000::/40
/ipv6 firewall address-list add list=aws-s3-eu-west-2 address=2a05:d059:c000::/40
/ipv6 firewall address-list add list=aws-s3-eu-west-2 address=2a05:d070:c000::/40
/ipv6 firewall address-list add list=aws-s3-eu-west-2 address=2a05:d074:c000::/40
/ipv6 firewall address-list add list=aws-s3-eu-west-2 address=2a05:d078:c000::/40
/ipv6 firewall address-list add list=aws-s3-eu-west-2 address=2a05:d079:c000::/40
/ipv6 firewall address-list add list=aws-s3-eu-west-2 address=2a05:d07a:c000::/40

# S3 prefix list for us-west-1
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-us-west-1.rsc

/ip firewall address-list remove [find list=aws-s3-us-west-1]
/ipv6 firewall address-list remove [find list=aws-s3-us-west-1]

/ip firewall address-list add list=aws-s3-us-west-1 address=1.178.100.0/24
/ip firewall address-list add list=aws-s3-us-west-1 address=16.15.0.0/21
/ip firewall address-list add list=aws-s3-us-west-1 address=3.5.160.0/22
/ip firewall address-list add list=aws-s3-us-west-1 address=52.219.112.0/21
/ip firewall address-list add list=aws-s3-us-west-1 address=52.219.120.0/22
/ip firewall address-list add list=aws-s3-us-west-1 address=52.219.192.0/23
/ip firewall address-list add list=aws-s3-us-west-1 address=52.219.194.0/24
/ip firewall address-list add list=aws-s3-us-west-1 address=52.219.216.0/23
/ip firewall address-list add list=aws-s3-us-west-1 address=52.219.220.0/23
/ip firewall address-list add list=aws-s3-us-west-1 address=52.219.23.0/24
/ip firewall address-list add list=aws-s3-us-west-1 address=52.219.24.0/21
/ip firewall address-list add list=aws-s3-us-west-1 address=52.219.255.0/24
/ipv6 firewall address-list add list=aws-s3-us-west-1 address=2600:1f60:c000::/40
/ipv6 firewall address-list add list=aws-s3-us-west-1 address=2600:1fa0:c000::/40
/ipv6 firewall address-list add list=aws-s3-us-west-1 address=2600:1fb9:c000::/40
/ipv6 firewall address-list add list=aws-s3-us-west-1 address=2600:1ff0:c000::/40
/ipv6 firewall address-list add list=aws-s3-us-west-1 address=2600:1ff4:c000::/40
/ipv6 firewall address-list add list=aws-s3-us-west-1 address=2600:1ff8:c000::/40
/ipv6 firewall address-list add list=aws-s3-us-west-1 address=2600:1ff9:c000::/40
/ipv6 firewall address-list add list=aws-s3-us-west-1 address=2600:1ffa:c000::/40
/ipv6 firewall address-list add list=aws-s3-us-west-1 address=2600:f0f1:82::/48

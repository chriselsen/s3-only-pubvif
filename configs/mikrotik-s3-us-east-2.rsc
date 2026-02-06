# S3 prefix list for us-east-2
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-us-east-2.rsc

/ip firewall address-list remove [find list=aws-s3-us-east-2]
/ipv6 firewall address-list remove [find list=aws-s3-us-east-2]

/ip firewall address-list add list=aws-s3-us-east-2 address=1.178.8.0/24
/ip firewall address-list add list=aws-s3-us-east-2 address=16.12.60.0/22
/ip firewall address-list add list=aws-s3-us-east-2 address=16.12.64.0/22
/ip firewall address-list add list=aws-s3-us-east-2 address=18.34.252.0/22
/ip firewall address-list add list=aws-s3-us-east-2 address=18.34.72.0/21
/ip firewall address-list add list=aws-s3-us-east-2 address=3.2.67.0/24
/ip firewall address-list add list=aws-s3-us-east-2 address=3.5.128.0/22
/ip firewall address-list add list=aws-s3-us-east-2 address=3.5.132.0/23
/ip firewall address-list add list=aws-s3-us-east-2 address=3.5.88.0/22
/ip firewall address-list add list=aws-s3-us-east-2 address=3.5.92.0/23
/ip firewall address-list add list=aws-s3-us-east-2 address=52.219.141.0/24
/ip firewall address-list add list=aws-s3-us-east-2 address=52.219.142.0/24
/ip firewall address-list add list=aws-s3-us-east-2 address=52.219.143.0/24
/ip firewall address-list add list=aws-s3-us-east-2 address=52.219.176.0/22
/ip firewall address-list add list=aws-s3-us-east-2 address=52.219.212.0/22
/ip firewall address-list add list=aws-s3-us-east-2 address=52.219.224.0/22
/ip firewall address-list add list=aws-s3-us-east-2 address=52.219.228.0/22
/ip firewall address-list add list=aws-s3-us-east-2 address=52.219.232.0/22
/ip firewall address-list add list=aws-s3-us-east-2 address=52.219.80.0/20
/ip firewall address-list add list=aws-s3-us-east-2 address=52.219.96.0/20
/ipv6 firewall address-list add list=aws-s3-us-east-2 address=2600:1f60:6000::/40
/ipv6 firewall address-list add list=aws-s3-us-east-2 address=2600:1fa0:6000::/40
/ipv6 firewall address-list add list=aws-s3-us-east-2 address=2600:1fb9:6000::/40
/ipv6 firewall address-list add list=aws-s3-us-east-2 address=2600:1ff0:6000::/40
/ipv6 firewall address-list add list=aws-s3-us-east-2 address=2600:1ff4:6000::/40
/ipv6 firewall address-list add list=aws-s3-us-east-2 address=2600:1ff8:6000::/40
/ipv6 firewall address-list add list=aws-s3-us-east-2 address=2600:1ff9:6000::/40
/ipv6 firewall address-list add list=aws-s3-us-east-2 address=2600:1ffa:6000::/40
/ipv6 firewall address-list add list=aws-s3-us-east-2 address=2600:f0f0:6103::/48
/ipv6 firewall address-list add list=aws-s3-us-east-2 address=2600:f0f2:7014::/48

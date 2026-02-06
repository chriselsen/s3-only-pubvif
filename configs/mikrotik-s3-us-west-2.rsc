# S3 prefix list for us-west-2
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-us-west-2.rsc

/ip firewall address-list remove [find list=aws-s3-us-west-2]
/ipv6 firewall address-list remove [find list=aws-s3-us-west-2]

/ip firewall address-list add list=aws-s3-us-west-2 address=1.178.65.0/24
/ip firewall address-list add list=aws-s3-us-west-2 address=1.178.9.0/24
/ip firewall address-list add list=aws-s3-us-west-2 address=16.12.104.0/21
/ip firewall address-list add list=aws-s3-us-west-2 address=16.12.112.0/21
/ip firewall address-list add list=aws-s3-us-west-2 address=16.12.88.0/21
/ip firewall address-list add list=aws-s3-us-west-2 address=16.12.96.0/21
/ip firewall address-list add list=aws-s3-us-west-2 address=16.15.32.0/20
/ip firewall address-list add list=aws-s3-us-west-2 address=18.34.244.0/22
/ip firewall address-list add list=aws-s3-us-west-2 address=18.34.48.0/20
/ip firewall address-list add list=aws-s3-us-west-2 address=3.2.68.0/24
/ip firewall address-list add list=aws-s3-us-west-2 address=3.5.76.0/22
/ip firewall address-list add list=aws-s3-us-west-2 address=3.5.80.0/21
/ip firewall address-list add list=aws-s3-us-west-2 address=52.218.128.0/17
/ip firewall address-list add list=aws-s3-us-west-2 address=52.92.128.0/17
/ipv6 firewall address-list add list=aws-s3-us-west-2 address=2600:1f60:4000::/39
/ipv6 firewall address-list add list=aws-s3-us-west-2 address=2600:1fa0:4000::/39
/ipv6 firewall address-list add list=aws-s3-us-west-2 address=2600:1fb9:4000::/39
/ipv6 firewall address-list add list=aws-s3-us-west-2 address=2600:1ff0:4000::/39
/ipv6 firewall address-list add list=aws-s3-us-west-2 address=2600:1ff4:4000::/39
/ipv6 firewall address-list add list=aws-s3-us-west-2 address=2600:1ff8:4000::/39
/ipv6 firewall address-list add list=aws-s3-us-west-2 address=2600:1ff9:4000::/39
/ipv6 firewall address-list add list=aws-s3-us-west-2 address=2600:1ffa:4000::/40
/ipv6 firewall address-list add list=aws-s3-us-west-2 address=2600:f0f0:6104::/48
/ipv6 firewall address-list add list=aws-s3-us-west-2 address=2600:f0f2:7013::/48
/ipv6 firewall address-list add list=aws-s3-us-west-2 address=2600:f0f2:7017::/48

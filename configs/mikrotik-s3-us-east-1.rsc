# S3 prefix list for us-east-1
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-us-east-1.rsc

/ip firewall address-list remove [find list=aws-s3-us-east-1]
/ipv6 firewall address-list remove [find list=aws-s3-us-east-1]

/ip firewall address-list add list=aws-s3-us-east-1 address=1.178.4.0/24
/ip firewall address-list add list=aws-s3-us-east-1 address=1.178.5.0/24
/ip firewall address-list add list=aws-s3-us-east-1 address=1.178.6.0/24
/ip firewall address-list add list=aws-s3-us-east-1 address=16.15.176.0/20
/ip firewall address-list add list=aws-s3-us-east-1 address=16.15.192.0/18
/ip firewall address-list add list=aws-s3-us-east-1 address=16.182.0.0/16
/ip firewall address-list add list=aws-s3-us-east-1 address=18.34.0.0/19
/ip firewall address-list add list=aws-s3-us-east-1 address=18.34.232.0/21
/ip firewall address-list add list=aws-s3-us-east-1 address=3.2.64.0/24
/ip firewall address-list add list=aws-s3-us-east-1 address=3.2.65.0/24
/ip firewall address-list add list=aws-s3-us-east-1 address=3.2.74.0/24
/ip firewall address-list add list=aws-s3-us-east-1 address=3.5.0.0/19
/ip firewall address-list add list=aws-s3-us-east-1 address=52.216.0.0/15
/ip firewall address-list add list=aws-s3-us-east-1 address=54.231.0.0/16
/ipv6 firewall address-list add list=aws-s3-us-east-1 address=2600:1f60:8000::/39
/ipv6 firewall address-list add list=aws-s3-us-east-1 address=2600:1fa0:2c00::/40
/ipv6 firewall address-list add list=aws-s3-us-east-1 address=2600:1fa0:8000::/39
/ipv6 firewall address-list add list=aws-s3-us-east-1 address=2600:1fb9:8000::/39
/ipv6 firewall address-list add list=aws-s3-us-east-1 address=2600:1ff0:8000::/39
/ipv6 firewall address-list add list=aws-s3-us-east-1 address=2600:1ff4:8000::/39
/ipv6 firewall address-list add list=aws-s3-us-east-1 address=2600:1ff8:2c00::/40
/ipv6 firewall address-list add list=aws-s3-us-east-1 address=2600:1ff8:8000::/39
/ipv6 firewall address-list add list=aws-s3-us-east-1 address=2600:1ff9:2c00::/40
/ipv6 firewall address-list add list=aws-s3-us-east-1 address=2600:1ff9:8000::/39
/ipv6 firewall address-list add list=aws-s3-us-east-1 address=2600:1ffa:8000::/40
/ipv6 firewall address-list add list=aws-s3-us-east-1 address=2600:f0f0:6100::/48
/ipv6 firewall address-list add list=aws-s3-us-east-1 address=2600:f0f0:6101::/48
/ipv6 firewall address-list add list=aws-s3-us-east-1 address=2600:f0f0:610a::/48
/ipv6 firewall address-list add list=aws-s3-us-east-1 address=2600:f0f2:7010::/48
/ipv6 firewall address-list add list=aws-s3-us-east-1 address=2600:f0f2:7011::/48
/ipv6 firewall address-list add list=aws-s3-us-east-1 address=2600:f0f2:7012::/48

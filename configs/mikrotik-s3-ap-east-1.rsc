# S3 prefix list for ap-east-1
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-ap-east-1.rsc

/ip firewall address-list remove [find list=aws-s3-ap-east-1]
/ipv6 firewall address-list remove [find list=aws-s3-ap-east-1]

/ip firewall address-list add list=aws-s3-ap-east-1 address=1.178.103.0/24
/ip firewall address-list add list=aws-s3-ap-east-1 address=16.12.6.0/23
/ip firewall address-list add list=aws-s3-ap-east-1 address=16.12.8.0/24
/ip firewall address-list add list=aws-s3-ap-east-1 address=3.5.214.0/23
/ip firewall address-list add list=aws-s3-ap-east-1 address=3.5.236.0/22
/ip firewall address-list add list=aws-s3-ap-east-1 address=52.95.160.0/23
/ip firewall address-list add list=aws-s3-ap-east-1 address=52.95.162.0/24
/ipv6 firewall address-list add list=aws-s3-ap-east-1 address=2406:da60:e000::/40
/ipv6 firewall address-list add list=aws-s3-ap-east-1 address=2406:daa0:e000::/40
/ipv6 firewall address-list add list=aws-s3-ap-east-1 address=2406:dab9:e000::/40
/ipv6 firewall address-list add list=aws-s3-ap-east-1 address=2406:daf0:e000::/40
/ipv6 firewall address-list add list=aws-s3-ap-east-1 address=2406:daf4:e000::/40
/ipv6 firewall address-list add list=aws-s3-ap-east-1 address=2406:daf8:e000::/40
/ipv6 firewall address-list add list=aws-s3-ap-east-1 address=2406:daf9:e000::/40
/ipv6 firewall address-list add list=aws-s3-ap-east-1 address=2406:dafa:e000::/40
/ipv6 firewall address-list add list=aws-s3-ap-east-1 address=2600:f0f1:85::/48

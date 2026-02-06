# S3 prefix list for ap-southeast-2
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-ap-southeast-2.rsc

/ip firewall address-list remove [find list=aws-s3-ap-southeast-2]
/ipv6 firewall address-list remove [find list=aws-s3-ap-southeast-2]

/ip firewall address-list add list=aws-s3-ap-southeast-2 address=1.178.11.0/24
/ip firewall address-list add list=aws-s3-ap-southeast-2 address=16.12.74.0/24
/ip firewall address-list add list=aws-s3-ap-southeast-2 address=3.5.164.0/22
/ip firewall address-list add list=aws-s3-ap-southeast-2 address=3.5.168.0/23
/ip firewall address-list add list=aws-s3-ap-southeast-2 address=52.95.128.0/21
/ipv6 firewall address-list add list=aws-s3-ap-southeast-2 address=2406:da60:c000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-2 address=2406:daa0:c000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-2 address=2406:dab9:c000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-2 address=2406:daf0:c000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-2 address=2406:daf4:c000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-2 address=2406:daf8:c000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-2 address=2406:daf9:c000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-2 address=2406:dafa:c000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-2 address=2600:f0f2:7019::/48

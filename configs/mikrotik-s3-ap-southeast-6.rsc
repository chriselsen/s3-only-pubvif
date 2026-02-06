# S3 prefix list for ap-southeast-6
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-ap-southeast-6.rsc

/ip firewall address-list remove [find list=aws-s3-ap-southeast-6]
/ipv6 firewall address-list remove [find list=aws-s3-ap-southeast-6]

/ip firewall address-list add list=aws-s3-ap-southeast-6 address=1.178.27.0/24
/ip firewall address-list add list=aws-s3-ap-southeast-6 address=16.12.81.0/24
/ip firewall address-list add list=aws-s3-ap-southeast-6 address=16.12.82.0/23
/ip firewall address-list add list=aws-s3-ap-southeast-6 address=16.15.8.0/22
/ipv6 firewall address-list add list=aws-s3-ap-southeast-6 address=2406:da60:2800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-6 address=2406:daa0:2800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-6 address=2406:dab9:2800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-6 address=2406:daf0:2800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-6 address=2406:daf4:2800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-6 address=2406:daf8:2800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-6 address=2406:daf9:2800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-6 address=2600:f0f2:7021::/48

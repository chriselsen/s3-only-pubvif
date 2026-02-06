# S3 prefix list for ap-southeast-7
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-ap-southeast-7.rsc

/ip firewall address-list remove [find list=aws-s3-ap-southeast-7]
/ipv6 firewall address-list remove [find list=aws-s3-ap-southeast-7]

/ip firewall address-list add list=aws-s3-ap-southeast-7 address=1.178.28.0/24
/ip firewall address-list add list=aws-s3-ap-southeast-7 address=16.12.75.0/24
/ip firewall address-list add list=aws-s3-ap-southeast-7 address=16.12.76.0/23
/ip firewall address-list add list=aws-s3-ap-southeast-7 address=3.5.60.0/22
/ipv6 firewall address-list add list=aws-s3-ap-southeast-7 address=2406:da60:4800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-7 address=2406:daa0:4800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-7 address=2406:dab9:4800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-7 address=2406:daf0:4800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-7 address=2406:daf4:4800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-7 address=2406:daf8:4800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-7 address=2406:daf9:4800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-7 address=2600:f0f2:7022::/48

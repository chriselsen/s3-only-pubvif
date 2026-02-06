# S3 prefix list for ap-southeast-5
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-ap-southeast-5.rsc

/ip firewall address-list remove [find list=aws-s3-ap-southeast-5]
/ipv6 firewall address-list remove [find list=aws-s3-ap-southeast-5]

/ip firewall address-list add list=aws-s3-ap-southeast-5 address=1.178.102.0/24
/ip firewall address-list add list=aws-s3-ap-southeast-5 address=16.12.42.0/23
/ip firewall address-list add list=aws-s3-ap-southeast-5 address=16.12.44.0/24
/ip firewall address-list add list=aws-s3-ap-southeast-5 address=3.5.180.0/22
/ipv6 firewall address-list add list=aws-s3-ap-southeast-5 address=2406:da60:800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-5 address=2406:daa0:800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-5 address=2406:dab9:800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-5 address=2406:daf0:800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-5 address=2406:daf4:800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-5 address=2406:daf8:800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-5 address=2406:daf9:800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-5 address=2600:f0f1:84::/48

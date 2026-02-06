# S3 prefix list for ap-south-2
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-ap-south-2.rsc

/ip firewall address-list remove [find list=aws-s3-ap-south-2]
/ipv6 firewall address-list remove [find list=aws-s3-ap-south-2]

/ip firewall address-list add list=aws-s3-ap-south-2 address=1.178.23.0/24
/ip firewall address-list add list=aws-s3-ap-south-2 address=3.5.44.0/22
/ip firewall address-list add list=aws-s3-ap-south-2 address=52.95.184.0/23
/ip firewall address-list add list=aws-s3-ap-south-2 address=52.95.186.0/24
/ipv6 firewall address-list add list=aws-s3-ap-south-2 address=2406:da60:b000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south-2 address=2406:daa0:b000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south-2 address=2406:dab9:b000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south-2 address=2406:daf0:b000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south-2 address=2406:daf4:b000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south-2 address=2406:daf8:b000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south-2 address=2406:daf9:b000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south-2 address=2600:f0f1:8d::/48

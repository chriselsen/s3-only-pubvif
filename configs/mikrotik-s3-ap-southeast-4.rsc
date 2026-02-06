# S3 prefix list for ap-southeast-4
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-ap-southeast-4.rsc

/ip firewall address-list remove [find list=aws-s3-ap-southeast-4]
/ipv6 firewall address-list remove [find list=aws-s3-ap-southeast-4]

/ip firewall address-list add list=aws-s3-ap-southeast-4 address=1.178.24.0/24
/ip firewall address-list add list=aws-s3-ap-southeast-4 address=3.5.40.0/22
/ip firewall address-list add list=aws-s3-ap-southeast-4 address=52.95.166.0/23
/ip firewall address-list add list=aws-s3-ap-southeast-4 address=52.95.168.0/24
/ipv6 firewall address-list add list=aws-s3-ap-southeast-4 address=2406:da60:f000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-4 address=2406:daa0:f000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-4 address=2406:dab9:f000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-4 address=2406:daf0:f000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-4 address=2406:daf4:f000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-4 address=2406:daf8:f000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-4 address=2406:daf9:f000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-4 address=2600:f0f1:8e::/48

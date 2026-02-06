# S3 prefix list for ap-southeast-3
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-ap-southeast-3.rsc

/ip firewall address-list remove [find list=aws-s3-ap-southeast-3]
/ipv6 firewall address-list remove [find list=aws-s3-ap-southeast-3]

/ip firewall address-list add list=aws-s3-ap-southeast-3 address=1.178.19.0/24
/ip firewall address-list add list=aws-s3-ap-southeast-3 address=3.5.36.0/22
/ip firewall address-list add list=aws-s3-ap-southeast-3 address=52.95.177.0/24
/ip firewall address-list add list=aws-s3-ap-southeast-3 address=52.95.178.0/23
/ipv6 firewall address-list add list=aws-s3-ap-southeast-3 address=2406:da60:9000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-3 address=2406:daa0:9000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-3 address=2406:dab9:9000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-3 address=2406:daf0:9000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-3 address=2406:daf4:9000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-3 address=2406:daf8:9000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-3 address=2406:daf9:9000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-3 address=2600:f0f1:89::/48

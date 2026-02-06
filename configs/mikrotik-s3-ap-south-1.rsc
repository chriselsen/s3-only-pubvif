# S3 prefix list for ap-south-1
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-ap-south-1.rsc

/ip firewall address-list remove [find list=aws-s3-ap-south-1]
/ipv6 firewall address-list remove [find list=aws-s3-ap-south-1]

/ip firewall address-list add list=aws-s3-ap-south-1 address=1.178.88.0/24
/ip firewall address-list add list=aws-s3-ap-south-1 address=16.12.3.0/24
/ip firewall address-list add list=aws-s3-ap-south-1 address=16.12.36.0/22
/ip firewall address-list add list=aws-s3-ap-south-1 address=16.12.40.0/23
/ip firewall address-list add list=aws-s3-ap-south-1 address=3.2.69.0/24
/ip firewall address-list add list=aws-s3-ap-south-1 address=3.5.208.0/22
/ip firewall address-list add list=aws-s3-ap-south-1 address=3.5.212.0/23
/ip firewall address-list add list=aws-s3-ap-south-1 address=52.219.156.0/22
/ip firewall address-list add list=aws-s3-ap-south-1 address=52.219.160.0/23
/ip firewall address-list add list=aws-s3-ap-south-1 address=52.219.62.0/23
/ip firewall address-list add list=aws-s3-ap-south-1 address=52.219.64.0/22
/ipv6 firewall address-list add list=aws-s3-ap-south-1 address=2406:da60:a000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south-1 address=2406:daa0:a000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south-1 address=2406:dab9:a000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south-1 address=2406:daf0:a000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south-1 address=2406:daf4:a000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south-1 address=2406:daf8:a000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south-1 address=2406:daf9:a000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south-1 address=2406:dafa:a000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south-1 address=2600:f0f0:6105::/48
/ipv6 firewall address-list add list=aws-s3-ap-south-1 address=2600:f0f2:701a::/48

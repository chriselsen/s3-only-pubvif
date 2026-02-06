# S3 prefix list for ap-southeast-1
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-ap-southeast-1.rsc

/ip firewall address-list remove [find list=aws-s3-ap-southeast-1]
/ipv6 firewall address-list remove [find list=aws-s3-ap-southeast-1]

/ip firewall address-list add list=aws-s3-ap-southeast-1 address=1.178.89.0/24
/ip firewall address-list add list=aws-s3-ap-southeast-1 address=16.12.48.0/21
/ip firewall address-list add list=aws-s3-ap-southeast-1 address=3.5.146.0/23
/ip firewall address-list add list=aws-s3-ap-southeast-1 address=3.5.148.0/22
/ip firewall address-list add list=aws-s3-ap-southeast-1 address=52.219.124.0/22
/ip firewall address-list add list=aws-s3-ap-southeast-1 address=52.219.128.0/22
/ip firewall address-list add list=aws-s3-ap-southeast-1 address=52.219.132.0/22
/ip firewall address-list add list=aws-s3-ap-southeast-1 address=52.219.164.0/22
/ip firewall address-list add list=aws-s3-ap-southeast-1 address=52.219.180.0/22
/ip firewall address-list add list=aws-s3-ap-southeast-1 address=52.219.184.0/21
/ip firewall address-list add list=aws-s3-ap-southeast-1 address=52.219.32.0/21
/ip firewall address-list add list=aws-s3-ap-southeast-1 address=52.219.40.0/22
/ipv6 firewall address-list add list=aws-s3-ap-southeast-1 address=2406:da60:8000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-1 address=2406:da60:8800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-1 address=2406:daa0:8000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-1 address=2406:daa0:8800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-1 address=2406:daa0:a800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-1 address=2406:dab9:8000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-1 address=2406:dab9:8800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-1 address=2406:daf0:8000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-1 address=2406:daf0:8800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-1 address=2406:daf4:8000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-1 address=2406:daf4:8800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-1 address=2406:daf8:8000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-1 address=2406:daf8:8800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-1 address=2406:daf8:a800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-1 address=2406:daf9:8000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-1 address=2406:daf9:8800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-1 address=2406:daf9:a800::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-1 address=2406:dafa:8000::/40
/ipv6 firewall address-list add list=aws-s3-ap-southeast-1 address=2600:f0f2:701b::/48

# S3 prefix list for ap-northeast-2
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-ap-northeast-2.rsc

/ip firewall address-list remove [find list=aws-s3-ap-northeast-2]
/ipv6 firewall address-list remove [find list=aws-s3-ap-northeast-2]

/ip firewall address-list add list=aws-s3-ap-northeast-2 address=1.178.91.0/24
/ip firewall address-list add list=aws-s3-ap-northeast-2 address=3.5.140.0/22
/ip firewall address-list add list=aws-s3-ap-northeast-2 address=3.5.144.0/23
/ip firewall address-list add list=aws-s3-ap-northeast-2 address=3.5.184.0/21
/ip firewall address-list add list=aws-s3-ap-northeast-2 address=52.219.144.0/22
/ip firewall address-list add list=aws-s3-ap-northeast-2 address=52.219.148.0/23
/ip firewall address-list add list=aws-s3-ap-northeast-2 address=52.219.202.0/23
/ip firewall address-list add list=aws-s3-ap-northeast-2 address=52.219.204.0/22
/ip firewall address-list add list=aws-s3-ap-northeast-2 address=52.219.56.0/22
/ip firewall address-list add list=aws-s3-ap-northeast-2 address=52.219.60.0/23
/ipv6 firewall address-list add list=aws-s3-ap-northeast-2 address=2406:da60:2000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-2 address=2406:daa0:2000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-2 address=2406:dab9:2000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-2 address=2406:daf0:2000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-2 address=2406:daf4:2000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-2 address=2406:daf8:2000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-2 address=2406:daf9:2000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-2 address=2406:dafa:2000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-2 address=2600:f0f2:701d::/48

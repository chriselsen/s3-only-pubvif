# S3 prefix list for ap-northeast-1
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-ap-northeast-1.rsc

/ip firewall address-list remove [find list=aws-s3-ap-northeast-1]
/ipv6 firewall address-list remove [find list=aws-s3-ap-northeast-1]

/ip firewall address-list add list=aws-s3-ap-northeast-1 address=1.178.64.0/24
/ip firewall address-list add list=aws-s3-ap-northeast-1 address=3.2.66.0/24
/ip firewall address-list add list=aws-s3-ap-northeast-1 address=3.5.152.0/21
/ip firewall address-list add list=aws-s3-ap-northeast-1 address=52.219.0.0/20
/ip firewall address-list add list=aws-s3-ap-northeast-1 address=52.219.136.0/22
/ip firewall address-list add list=aws-s3-ap-northeast-1 address=52.219.150.0/23
/ip firewall address-list add list=aws-s3-ap-northeast-1 address=52.219.152.0/22
/ip firewall address-list add list=aws-s3-ap-northeast-1 address=52.219.16.0/22
/ip firewall address-list add list=aws-s3-ap-northeast-1 address=52.219.162.0/23
/ip firewall address-list add list=aws-s3-ap-northeast-1 address=52.219.172.0/22
/ip firewall address-list add list=aws-s3-ap-northeast-1 address=52.219.195.0/24
/ip firewall address-list add list=aws-s3-ap-northeast-1 address=52.219.196.0/22
/ip firewall address-list add list=aws-s3-ap-northeast-1 address=52.219.20.0/24
/ip firewall address-list add list=aws-s3-ap-northeast-1 address=52.219.200.0/24
/ip firewall address-list add list=aws-s3-ap-northeast-1 address=52.219.201.0/24
/ip firewall address-list add list=aws-s3-ap-northeast-1 address=52.219.21.0/24
/ip firewall address-list add list=aws-s3-ap-northeast-1 address=52.219.68.0/22
/ipv6 firewall address-list add list=aws-s3-ap-northeast-1 address=2406:da60:4000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-1 address=2406:daa0:4000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-1 address=2406:dab9:4000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-1 address=2406:daf0:4000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-1 address=2406:daf4:4000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-1 address=2406:daf8:4000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-1 address=2406:daf9:4000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-1 address=2406:dafa:4000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-1 address=2600:f0f0:6102::/48
/ipv6 firewall address-list add list=aws-s3-ap-northeast-1 address=2600:f0f2:7016::/48

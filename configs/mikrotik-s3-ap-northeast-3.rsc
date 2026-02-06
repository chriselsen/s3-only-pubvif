# S3 prefix list for ap-northeast-3
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-ap-northeast-3.rsc

/ip firewall address-list remove [find list=aws-s3-ap-northeast-3]
/ipv6 firewall address-list remove [find list=aws-s3-ap-northeast-3]

/ip firewall address-list add list=aws-s3-ap-northeast-3 address=1.178.101.0/24
/ip firewall address-list add list=aws-s3-ap-northeast-3 address=3.5.240.0/22
/ip firewall address-list add list=aws-s3-ap-northeast-3 address=52.95.157.0/24
/ip firewall address-list add list=aws-s3-ap-northeast-3 address=52.95.158.0/23
/ip firewall address-list add list=aws-s3-ap-northeast-3 address=52.95.181.0/24
/ip firewall address-list add list=aws-s3-ap-northeast-3 address=52.95.182.0/23
/ipv6 firewall address-list add list=aws-s3-ap-northeast-3 address=2406:da60:6000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-3 address=2406:daa0:6000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-3 address=2406:dab9:6000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-3 address=2406:daf0:6000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-3 address=2406:daf4:6000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-3 address=2406:daf8:6000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-3 address=2406:daf9:6000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-3 address=2406:dafa:6000::/40
/ipv6 firewall address-list add list=aws-s3-ap-northeast-3 address=2600:f0f1:83::/48

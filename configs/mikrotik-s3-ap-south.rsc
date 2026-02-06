# S3 prefix list for ap-south
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-ap-south.rsc

/ip firewall address-list remove [find list=aws-s3-ap-south]
/ipv6 firewall address-list remove [find list=aws-s3-ap-south]

/ip firewall address-list add list=aws-s3-ap-south address=1.178.23.0/24
/ip firewall address-list add list=aws-s3-ap-south address=1.178.88.0/24
/ip firewall address-list add list=aws-s3-ap-south address=16.12.3.0/24
/ip firewall address-list add list=aws-s3-ap-south address=16.12.36.0/22
/ip firewall address-list add list=aws-s3-ap-south address=16.12.40.0/23
/ip firewall address-list add list=aws-s3-ap-south address=3.2.69.0/24
/ip firewall address-list add list=aws-s3-ap-south address=3.5.208.0/22
/ip firewall address-list add list=aws-s3-ap-south address=3.5.212.0/23
/ip firewall address-list add list=aws-s3-ap-south address=3.5.44.0/22
/ip firewall address-list add list=aws-s3-ap-south address=52.219.156.0/22
/ip firewall address-list add list=aws-s3-ap-south address=52.219.160.0/23
/ip firewall address-list add list=aws-s3-ap-south address=52.219.62.0/23
/ip firewall address-list add list=aws-s3-ap-south address=52.219.64.0/22
/ip firewall address-list add list=aws-s3-ap-south address=52.95.184.0/23
/ip firewall address-list add list=aws-s3-ap-south address=52.95.186.0/24
/ipv6 firewall address-list add list=aws-s3-ap-south address=2406:da60:a000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south address=2406:da60:b000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south address=2406:daa0:a000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south address=2406:daa0:b000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south address=2406:dab9:a000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south address=2406:dab9:b000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south address=2406:daf0:a000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south address=2406:daf0:b000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south address=2406:daf4:a000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south address=2406:daf4:b000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south address=2406:daf8:a000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south address=2406:daf8:b000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south address=2406:daf9:a000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south address=2406:daf9:b000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south address=2406:dafa:a000::/40
/ipv6 firewall address-list add list=aws-s3-ap-south address=2600:f0f0:6105::/48
/ipv6 firewall address-list add list=aws-s3-ap-south address=2600:f0f1:8d::/48
/ipv6 firewall address-list add list=aws-s3-ap-south address=2600:f0f2:701a::/48

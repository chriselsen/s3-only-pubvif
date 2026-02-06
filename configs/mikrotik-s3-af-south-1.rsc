# S3 prefix list for af-south-1
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-af-south-1.rsc

/ip firewall address-list remove [find list=aws-s3-af-south-1]
/ipv6 firewall address-list remove [find list=aws-s3-af-south-1]

/ip firewall address-list add list=aws-s3-af-south-1 address=1.178.18.0/24
/ip firewall address-list add list=aws-s3-af-south-1 address=3.5.202.0/23
/ip firewall address-list add list=aws-s3-af-south-1 address=3.5.228.0/22
/ip firewall address-list add list=aws-s3-af-south-1 address=52.95.175.0/24
/ip firewall address-list add list=aws-s3-af-south-1 address=52.95.176.0/24
/ip firewall address-list add list=aws-s3-af-south-1 address=52.95.180.0/24
/ipv6 firewall address-list add list=aws-s3-af-south-1 address=2406:da60:1000::/40
/ipv6 firewall address-list add list=aws-s3-af-south-1 address=2406:daa0:1000::/40
/ipv6 firewall address-list add list=aws-s3-af-south-1 address=2406:dab9:1000::/40
/ipv6 firewall address-list add list=aws-s3-af-south-1 address=2406:daf0:1000::/40
/ipv6 firewall address-list add list=aws-s3-af-south-1 address=2406:daf4:1000::/40
/ipv6 firewall address-list add list=aws-s3-af-south-1 address=2406:daf8:1000::/40
/ipv6 firewall address-list add list=aws-s3-af-south-1 address=2406:daf9:1000::/40
/ipv6 firewall address-list add list=aws-s3-af-south-1 address=2600:f0f1:88::/48

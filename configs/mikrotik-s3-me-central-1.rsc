# S3 prefix list for me-central-1
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-me-central-1.rsc

/ip firewall address-list remove [find list=aws-s3-me-central-1]
/ipv6 firewall address-list remove [find list=aws-s3-me-central-1]

/ip firewall address-list add list=aws-s3-me-central-1 address=1.178.20.0/24
/ip firewall address-list add list=aws-s3-me-central-1 address=3.5.48.0/22
/ip firewall address-list add list=aws-s3-me-central-1 address=52.95.187.0/24
/ip firewall address-list add list=aws-s3-me-central-1 address=52.95.188.0/23
/ipv6 firewall address-list add list=aws-s3-me-central-1 address=2406:da60:7000::/40
/ipv6 firewall address-list add list=aws-s3-me-central-1 address=2406:daa0:7000::/40
/ipv6 firewall address-list add list=aws-s3-me-central-1 address=2406:dab9:7000::/40
/ipv6 firewall address-list add list=aws-s3-me-central-1 address=2406:daf0:7000::/40
/ipv6 firewall address-list add list=aws-s3-me-central-1 address=2406:daf4:7000::/40
/ipv6 firewall address-list add list=aws-s3-me-central-1 address=2406:daf8:7000::/40
/ipv6 firewall address-list add list=aws-s3-me-central-1 address=2406:daf9:7000::/40
/ipv6 firewall address-list add list=aws-s3-me-central-1 address=2600:f0f1:8a::/48

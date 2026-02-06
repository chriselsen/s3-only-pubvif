# S3 prefix list for eusc-de-east-1
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-eusc-de-east-1.rsc

/ip firewall address-list remove [find list=aws-s3-eusc-de-east-1]
/ipv6 firewall address-list remove [find list=aws-s3-eusc-de-east-1]

/ip firewall address-list add list=aws-s3-eusc-de-east-1 address=83.118.240.0/21
/ipv6 firewall address-list add list=aws-s3-eusc-de-east-1 address=2001:3fc5:800::/40
/ipv6 firewall address-list add list=aws-s3-eusc-de-east-1 address=2001:3fc7:800::/40
/ipv6 firewall address-list add list=aws-s3-eusc-de-east-1 address=2001:3fc7:8800::/40
/ipv6 firewall address-list add list=aws-s3-eusc-de-east-1 address=2001:3fc7:9800::/40
/ipv6 firewall address-list add list=aws-s3-eusc-de-east-1 address=2001:3fc7:a800::/40

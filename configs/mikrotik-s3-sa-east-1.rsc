# S3 prefix list for sa-east-1
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-sa-east-1.rsc

/ip firewall address-list remove [find list=aws-s3-sa-east-1]
/ipv6 firewall address-list remove [find list=aws-s3-sa-east-1]

/ip firewall address-list add list=aws-s3-sa-east-1 address=1.178.95.0/24
/ip firewall address-list add list=aws-s3-sa-east-1 address=16.12.0.0/23
/ip firewall address-list add list=aws-s3-sa-east-1 address=16.12.2.0/24
/ip firewall address-list add list=aws-s3-sa-east-1 address=3.5.232.0/22
/ip firewall address-list add list=aws-s3-sa-east-1 address=52.95.163.0/24
/ip firewall address-list add list=aws-s3-sa-east-1 address=52.95.164.0/23
/ipv6 firewall address-list add list=aws-s3-sa-east-1 address=2600:1f60:e000::/40
/ipv6 firewall address-list add list=aws-s3-sa-east-1 address=2600:1fa0:e000::/40
/ipv6 firewall address-list add list=aws-s3-sa-east-1 address=2600:1fb9:e000::/40
/ipv6 firewall address-list add list=aws-s3-sa-east-1 address=2600:1ff0:e000::/40
/ipv6 firewall address-list add list=aws-s3-sa-east-1 address=2600:1ff4:e000::/40
/ipv6 firewall address-list add list=aws-s3-sa-east-1 address=2600:1ff8:e000::/40
/ipv6 firewall address-list add list=aws-s3-sa-east-1 address=2600:1ff9:e000::/40
/ipv6 firewall address-list add list=aws-s3-sa-east-1 address=2600:1ffa:e000::/40
/ipv6 firewall address-list add list=aws-s3-sa-east-1 address=2600:f0f1:81::/48

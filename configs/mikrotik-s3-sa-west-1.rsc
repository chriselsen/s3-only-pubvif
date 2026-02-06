# S3 prefix list for sa-west-1
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-sa-west-1.rsc

/ip firewall address-list remove [find list=aws-s3-sa-west-1]
/ipv6 firewall address-list remove [find list=aws-s3-sa-west-1]

/ip firewall address-list add list=aws-s3-sa-west-1 address=16.12.120.0/22
/ip firewall address-list add list=aws-s3-sa-west-1 address=16.15.24.0/22
/ipv6 firewall address-list add list=aws-s3-sa-west-1 address=2600:1fa0:ec00::/40
/ipv6 firewall address-list add list=aws-s3-sa-west-1 address=2600:1fb9:ec00::/40
/ipv6 firewall address-list add list=aws-s3-sa-west-1 address=2600:1fef:ec00::/40
/ipv6 firewall address-list add list=aws-s3-sa-west-1 address=2600:1ff0:ec00::/40
/ipv6 firewall address-list add list=aws-s3-sa-west-1 address=2600:1ff4:ec00::/40
/ipv6 firewall address-list add list=aws-s3-sa-west-1 address=2600:1ff8:ec00::/40
/ipv6 firewall address-list add list=aws-s3-sa-west-1 address=2600:1ff9:ec00::/40

# S3 prefix list for us-gov-west-1
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-us-gov-west-1.rsc

/ip firewall address-list remove [find list=aws-s3-us-gov-west-1]
/ipv6 firewall address-list remove [find list=aws-s3-us-gov-west-1]

/ip firewall address-list add list=aws-s3-us-gov-west-1 address=108.175.48.0/22
/ip firewall address-list add list=aws-s3-us-gov-west-1 address=108.175.56.0/22
/ip firewall address-list add list=aws-s3-us-gov-west-1 address=136.18.0.0/23
/ipv6 firewall address-list add list=aws-s3-us-gov-west-1 address=2600:1f60:2000::/40
/ipv6 firewall address-list add list=aws-s3-us-gov-west-1 address=2600:1fa0:2000::/40
/ipv6 firewall address-list add list=aws-s3-us-gov-west-1 address=2600:1fb9:2000::/40
/ipv6 firewall address-list add list=aws-s3-us-gov-west-1 address=2600:1ff0:2000::/40
/ipv6 firewall address-list add list=aws-s3-us-gov-west-1 address=2600:1ff4:2000::/40
/ipv6 firewall address-list add list=aws-s3-us-gov-west-1 address=2600:1ff8:2000::/40
/ipv6 firewall address-list add list=aws-s3-us-gov-west-1 address=2600:1ff9:2000::/40
/ipv6 firewall address-list add list=aws-s3-us-gov-west-1 address=2600:1ffa:2000::/40

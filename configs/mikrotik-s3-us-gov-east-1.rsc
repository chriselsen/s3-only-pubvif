# S3 prefix list for us-gov-east-1
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-us-gov-east-1.rsc

/ip firewall address-list remove [find list=aws-s3-us-gov-east-1]
/ipv6 firewall address-list remove [find list=aws-s3-us-gov-east-1]

/ip firewall address-list add list=aws-s3-us-gov-east-1 address=108.175.52.0/22
/ip firewall address-list add list=aws-s3-us-gov-east-1 address=108.175.60.0/22
/ipv6 firewall address-list add list=aws-s3-us-gov-east-1 address=2600:1f60:5000::/40
/ipv6 firewall address-list add list=aws-s3-us-gov-east-1 address=2600:1fa0:5000::/40
/ipv6 firewall address-list add list=aws-s3-us-gov-east-1 address=2600:1fb9:5000::/40
/ipv6 firewall address-list add list=aws-s3-us-gov-east-1 address=2600:1ff0:5000::/40
/ipv6 firewall address-list add list=aws-s3-us-gov-east-1 address=2600:1ff4:5000::/40
/ipv6 firewall address-list add list=aws-s3-us-gov-east-1 address=2600:1ff8:5000::/36
/ipv6 firewall address-list add list=aws-s3-us-gov-east-1 address=2600:1ff9:5000::/40
/ipv6 firewall address-list add list=aws-s3-us-gov-east-1 address=2600:1ffa:5000::/40

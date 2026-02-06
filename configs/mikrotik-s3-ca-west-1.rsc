# S3 prefix list for ca-west-1
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-ca-west-1.rsc

/ip firewall address-list remove [find list=aws-s3-ca-west-1]
/ipv6 firewall address-list remove [find list=aws-s3-ca-west-1]

/ip firewall address-list add list=aws-s3-ca-west-1 address=1.178.26.0/24
/ip firewall address-list add list=aws-s3-ca-west-1 address=16.12.56.0/23
/ip firewall address-list add list=aws-s3-ca-west-1 address=16.12.58.0/24
/ip firewall address-list add list=aws-s3-ca-west-1 address=3.5.172.0/22
/ipv6 firewall address-list add list=aws-s3-ca-west-1 address=2600:1f60:a400::/40
/ipv6 firewall address-list add list=aws-s3-ca-west-1 address=2600:1fa0:a400::/40
/ipv6 firewall address-list add list=aws-s3-ca-west-1 address=2600:1fb9:a400::/40
/ipv6 firewall address-list add list=aws-s3-ca-west-1 address=2600:1ff0:a400::/40
/ipv6 firewall address-list add list=aws-s3-ca-west-1 address=2600:1ff4:a400::/40
/ipv6 firewall address-list add list=aws-s3-ca-west-1 address=2600:1ff8:a400::/40
/ipv6 firewall address-list add list=aws-s3-ca-west-1 address=2600:1ff9:a400::/40
/ipv6 firewall address-list add list=aws-s3-ca-west-1 address=2600:f0f2:7020::/48

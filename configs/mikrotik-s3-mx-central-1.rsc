# S3 prefix list for mx-central-1
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-mx-central-1.rsc

/ip firewall address-list remove [find list=aws-s3-mx-central-1]
/ipv6 firewall address-list remove [find list=aws-s3-mx-central-1]

/ip firewall address-list add list=aws-s3-mx-central-1 address=1.178.29.0/24
/ip firewall address-list add list=aws-s3-mx-central-1 address=16.12.71.0/24
/ip firewall address-list add list=aws-s3-mx-central-1 address=16.12.72.0/23
/ip firewall address-list add list=aws-s3-mx-central-1 address=3.5.192.0/22
/ipv6 firewall address-list add list=aws-s3-mx-central-1 address=2600:1f60:7400::/40
/ipv6 firewall address-list add list=aws-s3-mx-central-1 address=2600:1fa0:7400::/40
/ipv6 firewall address-list add list=aws-s3-mx-central-1 address=2600:1fb9:7400::/40
/ipv6 firewall address-list add list=aws-s3-mx-central-1 address=2600:1ff0:7400::/40
/ipv6 firewall address-list add list=aws-s3-mx-central-1 address=2600:1ff4:7400::/40
/ipv6 firewall address-list add list=aws-s3-mx-central-1 address=2600:1ff8:7400::/40
/ipv6 firewall address-list add list=aws-s3-mx-central-1 address=2600:1ff9:7400::/40
/ipv6 firewall address-list add list=aws-s3-mx-central-1 address=2600:f0f2:7023::/48

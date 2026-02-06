# S3 prefix list for ca-central-1
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-ca-central-1.rsc

/ip firewall address-list remove [find list=aws-s3-ca-central-1]
/ipv6 firewall address-list remove [find list=aws-s3-ca-central-1]

/ip firewall address-list add list=aws-s3-ca-central-1 address=1.178.92.0/24
/ip firewall address-list add list=aws-s3-ca-central-1 address=16.12.4.0/23
/ip firewall address-list add list=aws-s3-ca-central-1 address=3.5.252.0/22
/ip firewall address-list add list=aws-s3-ca-central-1 address=52.95.145.0/24
/ip firewall address-list add list=aws-s3-ca-central-1 address=52.95.146.0/23
/ip firewall address-list add list=aws-s3-ca-central-1 address=52.95.190.0/24
/ipv6 firewall address-list add list=aws-s3-ca-central-1 address=2600:1f60:1000::/40
/ipv6 firewall address-list add list=aws-s3-ca-central-1 address=2600:1fa0:1000::/40
/ipv6 firewall address-list add list=aws-s3-ca-central-1 address=2600:1fb9:1000::/40
/ipv6 firewall address-list add list=aws-s3-ca-central-1 address=2600:1ff0:1000::/40
/ipv6 firewall address-list add list=aws-s3-ca-central-1 address=2600:1ff4:1000::/40
/ipv6 firewall address-list add list=aws-s3-ca-central-1 address=2600:1ff8:1000::/40
/ipv6 firewall address-list add list=aws-s3-ca-central-1 address=2600:1ff9:1000::/40
/ipv6 firewall address-list add list=aws-s3-ca-central-1 address=2600:1ffa:1000::/40
/ipv6 firewall address-list add list=aws-s3-ca-central-1 address=2600:f0f2:701e::/48

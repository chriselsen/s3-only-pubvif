# S3 prefix list for eu-south-1
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-eu-south-1.rsc

/ip firewall address-list remove [find list=aws-s3-eu-south-1]
/ipv6 firewall address-list remove [find list=aws-s3-eu-south-1]

/ip firewall address-list add list=aws-s3-eu-south-1 address=1.178.17.0/24
/ip firewall address-list add list=aws-s3-eu-south-1 address=16.12.21.0/24
/ip firewall address-list add list=aws-s3-eu-south-1 address=16.12.59.0/24
/ip firewall address-list add list=aws-s3-eu-south-1 address=3.5.248.0/22
/ip firewall address-list add list=aws-s3-eu-south-1 address=52.219.254.0/24
/ip firewall address-list add list=aws-s3-eu-south-1 address=52.95.151.0/24
/ip firewall address-list add list=aws-s3-eu-south-1 address=52.95.152.0/23
/ipv6 firewall address-list add list=aws-s3-eu-south-1 address=2600:f0f1:87::/48
/ipv6 firewall address-list add list=aws-s3-eu-south-1 address=2a05:d030:a000::/40
/ipv6 firewall address-list add list=aws-s3-eu-south-1 address=2a05:d050:a000::/40
/ipv6 firewall address-list add list=aws-s3-eu-south-1 address=2a05:d059:a000::/40
/ipv6 firewall address-list add list=aws-s3-eu-south-1 address=2a05:d070:a000::/40
/ipv6 firewall address-list add list=aws-s3-eu-south-1 address=2a05:d074:a000::/40
/ipv6 firewall address-list add list=aws-s3-eu-south-1 address=2a05:d078:a000::/40
/ipv6 firewall address-list add list=aws-s3-eu-south-1 address=2a05:d079:a000::/40
/ipv6 firewall address-list add list=aws-s3-eu-south-1 address=2a05:d07a:a000::/40

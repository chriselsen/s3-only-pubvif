# S3 prefix list for eu-south-2
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-eu-south-2.rsc

/ip firewall address-list remove [find list=aws-s3-eu-south-2]
/ipv6 firewall address-list remove [find list=aws-s3-eu-south-2]

/ip firewall address-list add list=aws-s3-eu-south-2 address=1.178.22.0/24
/ip firewall address-list add list=aws-s3-eu-south-2 address=16.15.12.0/22
/ip firewall address-list add list=aws-s3-eu-south-2 address=3.5.126.0/23
/ip firewall address-list add list=aws-s3-eu-south-2 address=3.5.32.0/22
/ip firewall address-list add list=aws-s3-eu-south-2 address=52.95.136.0/23
/ip firewall address-list add list=aws-s3-eu-south-2 address=52.95.138.0/24
/ipv6 firewall address-list add list=aws-s3-eu-south-2 address=2600:f0f1:8c::/48
/ipv6 firewall address-list add list=aws-s3-eu-south-2 address=2a05:d030:1000::/40
/ipv6 firewall address-list add list=aws-s3-eu-south-2 address=2a05:d050:1000::/40
/ipv6 firewall address-list add list=aws-s3-eu-south-2 address=2a05:d059:1000::/40
/ipv6 firewall address-list add list=aws-s3-eu-south-2 address=2a05:d070:1000::/40
/ipv6 firewall address-list add list=aws-s3-eu-south-2 address=2a05:d074:1000::/40
/ipv6 firewall address-list add list=aws-s3-eu-south-2 address=2a05:d078:1000::/40
/ipv6 firewall address-list add list=aws-s3-eu-south-2 address=2a05:d079:1000::/40

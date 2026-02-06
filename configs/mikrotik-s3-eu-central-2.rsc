# S3 prefix list for eu-central-2
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-eu-central-2.rsc

/ip firewall address-list remove [find list=aws-s3-eu-central-2]
/ipv6 firewall address-list remove [find list=aws-s3-eu-central-2]

/ip firewall address-list add list=aws-s3-eu-central-2 address=1.178.21.0/24
/ip firewall address-list add list=aws-s3-eu-central-2 address=3.5.52.0/22
/ip firewall address-list add list=aws-s3-eu-central-2 address=52.95.139.0/24
/ip firewall address-list add list=aws-s3-eu-central-2 address=52.95.140.0/23
/ipv6 firewall address-list add list=aws-s3-eu-central-2 address=2600:f0f1:8b::/48
/ipv6 firewall address-list add list=aws-s3-eu-central-2 address=2a05:d030:9000::/40
/ipv6 firewall address-list add list=aws-s3-eu-central-2 address=2a05:d050:9000::/40
/ipv6 firewall address-list add list=aws-s3-eu-central-2 address=2a05:d059:9000::/40
/ipv6 firewall address-list add list=aws-s3-eu-central-2 address=2a05:d070:9000::/40
/ipv6 firewall address-list add list=aws-s3-eu-central-2 address=2a05:d074:9000::/40
/ipv6 firewall address-list add list=aws-s3-eu-central-2 address=2a05:d078:9000::/40
/ipv6 firewall address-list add list=aws-s3-eu-central-2 address=2a05:d079:9000::/40

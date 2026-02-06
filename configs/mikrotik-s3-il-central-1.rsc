# S3 prefix list for il-central-1
# Last updated: 2026-02-06 19:27:50 UTC
#
# Import with: /import file-name=mikrotik-s3-il-central-1.rsc

/ip firewall address-list remove [find list=aws-s3-il-central-1]
/ipv6 firewall address-list remove [find list=aws-s3-il-central-1]

/ip firewall address-list add list=aws-s3-il-central-1 address=1.178.25.0/24
/ip firewall address-list add list=aws-s3-il-central-1 address=16.12.12.0/23
/ip firewall address-list add list=aws-s3-il-central-1 address=16.12.14.0/24
/ip firewall address-list add list=aws-s3-il-central-1 address=3.5.56.0/22
/ipv6 firewall address-list add list=aws-s3-il-central-1 address=2600:f0f1:8f::/48
/ipv6 firewall address-list add list=aws-s3-il-central-1 address=2a05:d030:5000::/40
/ipv6 firewall address-list add list=aws-s3-il-central-1 address=2a05:d050:5000::/40
/ipv6 firewall address-list add list=aws-s3-il-central-1 address=2a05:d059:5000::/40
/ipv6 firewall address-list add list=aws-s3-il-central-1 address=2a05:d070:5000::/40
/ipv6 firewall address-list add list=aws-s3-il-central-1 address=2a05:d074:5000::/40
/ipv6 firewall address-list add list=aws-s3-il-central-1 address=2a05:d078:5000::/40
/ipv6 firewall address-list add list=aws-s3-il-central-1 address=2a05:d079:5000::/40

#!/bin/bash

# Create instance

cd terraform/
terraform init && terraform apply -auto-approve

# Create temp invetrory file for ansible
echo '[web]' > /tmp/inventory.tmp
ip=$(terraform output | cut -d ' ' -f 3)
path_private_key='./ssh/aws_key'
echo "$ip $path_private_key" >> /tmp/inventory.tmp

# Config instance

cd ../ansible
ansible web  --inventory-file=/tmp/inventory.tmp  main.yml

echo "Success!"

cd ../terraform
terraform output

# exit
cat /tmp/inventory.tmp
rm /tmp/inventory.tmp
exit 0



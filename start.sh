#!/bin/bash

# Create instance

cd terraform/
terraform init && terraform apply -auto-approve
echo '[web]' > /tmp/inventory.tmp
(terraform output | cut -d ' ' -f 3) >> /tmp/inventory.tmp

# Config instance

cd ../ansible
ansible web  --inventory-file=/tmp/inventory.tmp  -m ping

echo "Success!"

cd ../terraform
terraform output

# exit
cat /tmp/inventory.tmp
rm /tmp/inventory.tmp
exit 0



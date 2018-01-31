#!/bin/bash

# Create instance

cd terraform/
terraform init && terraform apply -auto-approve

# Export variables

export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""

# Create temp invetrory file for ansible
echo '[web]' > /tmp/inventory.tmp
ip=$(terraform output | cut -d ' ' -f 3)
path_private_key='ansible_ssh_private_key_file=../ssh/aws_key'
echo "$ip $path_private_key" >> /tmp/inventory.tmp

# Config instance

cd ../ansible
ansible-playbook -i /tmp/inventory.tmp main.yml

echo "Success!"

cd ../terraform
terraform output

# exit
#rm /tmp/inventory.tmp
exit 0



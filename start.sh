#!/bin/bash

# Create instance

cd terraform/
terraform init && terraform apply -auto-approve

# Export variables

<<<<<<< HEAD
 export AWS_ACCESS_KEY_ID="AKIAIQADMPJKDOJPFHAQ"
 export AWS_SECRET_ACCESS_KEY="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"
=======
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
>>>>>>> bdea02a9e19a0a7e020c9b3a053547909b33c636

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
<<<<<<< HEAD
rm /tmp/inventory.tmp
=======
#rm /tmp/inventory.tmp
>>>>>>> bdea02a9e19a0a7e020c9b3a053547909b33c636
exit 0



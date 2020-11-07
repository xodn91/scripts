#!/bin/bash
#find the file
FILE="terraform.tfvars"
if [ -f ./$FILE ]; then 
echo "terraform.tfvars found!"; mv $FILE ~/secrets; 
else
echo "terraform.tfvars not found, will now decrypt"  
fi

#decrypt the .asc file
gpg --decrypt --no-symkey-cache --output ./terraform.tfvars ~/secrets/terraform.tfvars.asc

#command to start terraform
terraform plan

#command to apply terraform
terraform apply

#wait for instance to complete before deleting .asc file
sleep 60

#remove all traces of tfvars file
rm ./terraform.tfvars*

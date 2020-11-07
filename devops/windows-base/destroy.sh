#!/bin/bash
#Decrypt the file

gpg --decrypt --no-symkey-cache --output ./terraform.tfvars ~/secrets/terraform.tfvars.asc

terraform destroy

sleep 60

rm ./terraform.tfvars*

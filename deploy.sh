#!/bin/bash

#Terraform steps to provision the infrastructure.
terraform init -backend=true
terraform plan -var-file="environments/bootcamp/terraform.tfvars" \
               -out=vm.tfplan     
terraform apply "vm.tfplan"
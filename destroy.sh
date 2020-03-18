#!/bin/bash

#Terraform steps to destroy the infrastructure.
terraform plan -destroy \
               -var-file="environments/bootcamp/terraform.tfvars" \
               -out=vm.tfplan
terraform apply "vm.tfplan"

               
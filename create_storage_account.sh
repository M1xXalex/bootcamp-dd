#!/bin/bash

storageAccountName=$1
storageAccountLocation=$2
storageAccountSku=$3
storageContainerName=$4
resourceGroupName=$5
resourceGroupLocation=$6

# Create a resource group
az group create --location $resourceGroupLocation --name $resourceGroupName

# Create a storage account
az storage account create --name $storageAccountName --location $storageAccountLocation --resource-group $resourceGroupName --sku $storageAccountSku

# Get the storage account key
storageAccountKey=$(az storage account keys list --account-name ${storageAccountName} --resource-group ${resourceGroupName} | jq -r .[0].value)

# Create a storage container
az storage container create --name $storageContainerName --account-name $storageAccountName --account-key $storageAccountKey
# This file will overwrite the default values
prefix = "bootcamp"
location = "West Europe"
vm_size = "Standard_B1ls"
subnet_address_prefix = "10.0.2.0/24"
virtual_network_address_space = ["10.0.0.0/16"]
private_ip_address_allocation = "Dynamic"
os_image_publisher = "OpenLogic"
os_image_offer = "CentOS"
os_image_sku = "7.5"
os_image_version = "latest"
os_disk_create_option = "FromImage"
os_disk_caching = "ReadWrite"
os_disk_managed_disk_type = "Standard_LRS"
os_admin_username = "bootcampuser"
disable_password_authentication = true
storage_account_tier = "Standard"
storage_account_replication_type = "LRS"
container_access_type = "container"
storage_blob_type = "Block"
storage_blob_source = "./modules/vm/bootcamp-installnginx.sh"
storage_account_kind = "StorageV2"
key_data = "FILL_WITH_THE_PUBLIC_KEY"

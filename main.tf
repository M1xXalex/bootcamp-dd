module "vm_module" {
  source = "./modules/vm"

  prefix                           = var.prefix
  location                         = var.location
  vm_size                          = var.vm_size
  subnet_address_prefix            = var.subnet_address_prefix
  virtual_network_address_space    = var.virtual_network_address_space
  private_ip_address_allocation    = var.private_ip_address_allocation
  os_image_publisher               = var.os_image_publisher
  os_image_offer                   = var.os_image_offer
  os_image_sku                     = var.os_image_sku
  os_image_version                 = var.os_image_version
  os_disk_create_option            = var.os_disk_create_option
  os_disk_caching                  = var.os_disk_caching
  os_disk_managed_disk_type        = var.os_disk_managed_disk_type
  os_admin_username                = var.os_admin_username
  disable_password_authentication  = var.disable_password_authentication
  storage_account_tier             = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type
  container_access_type            = var.container_access_type
  storage_blob_type                = var.storage_blob_type
  storage_blob_source              = var.storage_blob_source
  storage_account_kind             = var.storage_account_kind

}
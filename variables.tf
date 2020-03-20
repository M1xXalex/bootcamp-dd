variable "prefix" {
  description = "This is just a naming convention prefix"
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "vm_size" {
  description = "Specifies the size of the Virtual Machine"
  type        = string
}

variable "subnet_address_prefix" {
  description = "Defines the subnet"
  type        = string
}

variable "virtual_network_address_space" {
  description = "Defines the virtual network address space"
  type        = list
}

variable "private_ip_address_allocation" {
  description = "Defines how a private IP address is assigned. Options are Static or Dynamic."
  type        = string
}

variable "os_image_publisher" {
  description = "Specifies the publisher of the image used to create the virtual machine. Changing this forces a new resource to be created."
  type        = string
}

variable "os_image_offer" {
  description = "Specifies the offer of the image used to create the virtual machine. Changing this forces a new resource to be created."
  type        = string
}

variable "os_image_sku" {
  description = "Specifies the SKU of the image used to create the virtual machine. Changing this forces a new resource to be created."
  type        = string
}

variable "os_image_version" {
  description = "Specifies the version of the image used to create the virtual machine. Changing this forces a new resource to be created."
  type        = string
}

variable "os_disk_create_option" {
  description = " Specifies how the OS Disk should be created. Possible values are Attach (managed disks only) and FromImage"
  type        = string
}

variable "os_disk_caching" {
  description = "Specifies the caching requirements for the OS Disk. Possible values include None, ReadOnly and ReadWrite."
  type        = string
}

variable "os_disk_managed_disk_type" {
  description = "Specifies the type of Managed Disk which should be created. Possible values are Standard_LRS, StandardSSD_LRS or Premium_LRS"
  type        = string
}

variable "os_admin_username" {
  description = "Specifies the name of the local administrator account."
  type        = string
}

variable "disable_password_authentication" {
}

variable "storage_account_tier" {
  type       = string
}

variable "storage_account_replication_type" {
  type       = string
}

variable "container_access_type" {
  type       = string
}

variable "storage_blob_type" {
  type       = string
}

variable "storage_blob_source" {
  type       = string
}

variable "storage_account_kind" {
  type       = string
}

variable "key_data" {
  type        = string
}

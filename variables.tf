variable "prefix" {
  description = "This is just a naming convention prefix"
  type        = string
  default     = "bootcamp"
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
  default     = "West Europe"
}

variable "vm_size" {
  description = "Specifies the size of the Virtual Machine"
  type        = string
  default     = "Standard_B1ls"
}

variable "subnet_address_prefix" {
  description = "Defines the subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "virtual_network_address_space" {
  description = "Defines the virtual network address space"
  type        = list
  default     = ["10.0.0.0/16"]
}

variable "private_ip_address_allocation" {
  description = "Defines how a private IP address is assigned. Options are Static or Dynamic."
  type        = string
  default     = "Dynamic"
}

variable "os_image_publisher" {
  description = "Specifies the publisher of the image used to create the virtual machine. Changing this forces a new resource to be created."
  type        = string
  default     = "OpenLogic"
}

variable "os_image_offer" {
  description = "Specifies the offer of the image used to create the virtual machine. Changing this forces a new resource to be created."
  type        = string
  default     = "CentOS"
}

variable "os_image_sku" {
  description = "Specifies the SKU of the image used to create the virtual machine. Changing this forces a new resource to be created."
  type        = string
  default     = "7.5"
}

variable "os_image_version" {
  description = "Specifies the version of the image used to create the virtual machine. Changing this forces a new resource to be created."
  type        = string
  default     = "latest"
}

variable "os_disk_create_option" {
  description = " Specifies how the OS Disk should be created. Possible values are Attach (managed disks only) and FromImage"
  type        = string
  default     = "FromImage"
}

variable "os_disk_caching" {
  description = "Specifies the caching requirements for the OS Disk. Possible values include None, ReadOnly and ReadWrite."
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_managed_disk_type" {
  description = "Specifies the type of Managed Disk which should be created. Possible values are Standard_LRS, StandardSSD_LRS or Premium_LRS"
  type        = string
  default     = "Standard_LRS"
}

variable "os_admin_username" {
  description = "Specifies the name of the local administrator account."
  type        = string
  default     = "bootcampuser"
}

variable "disable_password_authentication" {
  default = true
}

variable "storage_account_tier" {
  default = "Standard"
}

variable "storage_account_replication_type" {
  default = "LRS"
}

variable "container_access_type" {
  default = "container"
}

variable "storage_blob_type" {
  default = "Block"
}

variable "storage_blob_source" {
  default = "bootcamp-installnginx.sh"
}

variable "storage_account_kind" {
  default = "StorageV2"
}


variable "environment_name" {
  description = "Specifies environment type by Name. Possible values are: p (Production), s (Pre-Production/Staging), a (Acceptance), t (Test), d (Development)"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Azure Container Registry. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "custom_tags" {
  type    = map(string)
  default = {}
}

locals {
  tags = merge(
    var.custom_tags,
    {
      "EnvironmentType"    = var.environment_name
    }
  )
}

variable "account_kind" {
  description = "Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Changing this forces a new resource to be created."
  type        = string
}

variable "account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium. For FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
  type        = string
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS."
  type        = string
}

variable "is_hns_enabled" {
  description = "Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2. Changing this forces a new resource to be created. Defaults to false."
  type        = string
}

variable "enable_blob_encryption" {
  description = "Boolean flag which controls if Encryption Services are enabled for Blob storage. Defaults to true"
  default     = true
}

variable "enable_file_encryption" {
  description = "Boolean flag which controls if Encryption Services are enabled for File storage. Defaults to true"
  default     = true
}

variable "enable_https_traffic_only" {
  description = "Boolean flag which forces HTTPS if enabled. Defaults to true."
  default     = true
}

locals {
  default_network_rules = {
    ip_rules = []
    subnet_ids = []
    bypass     = []
  }
}

variable "network_rules_default_action" {
  description = "Default action for the network rules."
  type        = string
  default     = "Deny"
}

variable "network_rules" {
  description = "Network rules restricing access to the storage account."
  type        = map(list(string))
  default     = null
}

variable "static_website" {
  description = "Enable static website for storage account."
  type        = bool
  default     = false
}

variable "static_website_index_document" {
  description = "The webpage that Azure Storage serves for requests to the root of a website or any subfolder."
  type        = string
  default     = "index.html"
}

variable "static_website_error_404_document" {
  description = "The absolute path to a custom webpage that should be used when a request is made which does not correspond to an existing file."
  type        = string
  default     = "index.html"
}

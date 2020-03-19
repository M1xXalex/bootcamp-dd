variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "environment_name" {
  description = "Specifies environment type by Name. Possible values are: p (Production), s (Pre-Production/Staging), a (Acceptance), t (Test), d (Development)"
  type        = string
}

variable "account_kind" {
  type = string
}

variable "account_tier" {
  type = string
}

variable "account_replication_type" {
  type = string
}

variable "is_hns_enabled" {
  type = string
}

variable "enable_https_traffic_only" {
  type = string
}

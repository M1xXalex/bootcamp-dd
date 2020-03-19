variable "environment_name" {
  description = "Specifies environment type by Name. Possible values are: p (Production), s (Pre-Production/Staging), a (Acceptance), t (Test), d (Development)."
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
      "EnvironmentName"    = var.environment_name
    },
  )
}

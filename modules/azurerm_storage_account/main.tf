resource "random_id" "suffix" {
  keepers = {
    ami_id = 1
  }

  byte_length = 8
}

resource "azurerm_storage_account" "st" {
  name                     = "${lower(substr("st${var.environment_name}${random_id.suffix.hex}",0,24))}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_kind             = var.account_kind
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  is_hns_enabled           = var.is_hns_enabled

  enable_https_traffic_only = var.enable_https_traffic_only

  dynamic "network_rules" {
    for_each = var.network_rules_default_action == "Deny" ? [1] : []
    content {
      default_action             = "Deny"
      ip_rules                   = concat(local.default_network_rules.ip_rules, lookup(var.network_rules, "ip_rules", []))
      virtual_network_subnet_ids = concat(local.default_network_rules.subnet_ids, lookup(var.network_rules, "subnet_ids", []))
      bypass                     = concat(local.default_network_rules.bypass, lookup(var.network_rules, "bypass", []))
    }
  }

  dynamic "static_website" {
    for_each = var.static_website == true ? [1] : []
    content {
      index_document     = var.static_website_index_document
      error_404_document = var.static_website_error_404_document
    }
  }

  tags = local.tags
}

module "rg_module" {
  source = "./modules/azurerm_resource_group/"

  # common
  environment_name        = var.environment_name
  location                = var.location

  # tags
  custom_tags             = local.custom_tags
}

module "storage_account_module" {
  source = "./modules/azurerm_storage_account/"

  # common
  environment_name             = var.environment_name
  location                     = var.location
  resource_group_name          = module.rg_module.name

  #tags
  custom_tags                  = local.custom_tags

  # storage 
  account_kind                 = var.account_kind
  account_tier                 = var.account_tier
  account_replication_type     = var.account_replication_type
  is_hns_enabled               = var.is_hns_enabled
  enable_https_traffic_only    = var.enable_https_traffic_only
  static_website               = true
  network_rules_default_action = "Allow"
  network_rules = {
    ip_rules   = [],
    bypass = [
      "AzureServices"
    ]
  }
}

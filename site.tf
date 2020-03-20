# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.1.0"
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "bootcamp-terraform"
    storage_account_name = "FILL_WITH_THE_UNIQ_STORAGE_NAME"
    container_name       = "tfstate"
    key                  = "bootcampdev.tfstate"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "rg${var.environment_name}"
  location = var.location

  tags = local.tags
}

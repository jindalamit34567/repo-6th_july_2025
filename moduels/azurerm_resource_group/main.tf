resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_resource_group" "resource_feature101" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_resource_group" "resource_group-102-new-rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}
 
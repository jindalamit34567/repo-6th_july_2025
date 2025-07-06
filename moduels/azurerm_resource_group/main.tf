resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

# New rg added for testing purposes-rg102
resource "azurerm_resource_group" "resource_group-102-new-rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}
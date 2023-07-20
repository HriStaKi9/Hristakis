# modules/module1/main.tf
resource "azurerm_virtual_network" "vnet" {
  name                = "my-vnet-${var.environment}"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = "my-resource-group-${var.environment}"
}

# You can add any additional configurations for the Vnet here

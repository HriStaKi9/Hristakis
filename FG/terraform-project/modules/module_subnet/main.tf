# modules/module2/main.tf
resource "azurerm_subnet" "subnet" {
  name                 = "my-subnet-${var.environment}"
  resource_group_name  = "my-resource-group-${var.environment}"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix       = "10.0.1.0/24"
}

# You can add any additional configurations for the subnet here

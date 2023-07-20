# modules/module3/main.tf
resource "azurerm_virtual_network_peering" "peering" {
  name                         = "vnet-peer-${var.environment}"
  resource_group_name          = "my-resource-group-${var.environment}"
  virtual_network_name         = azurerm_virtual_network.vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet.remote_virtual_network_id
  allow_virtual_network_access = true
}

# You can add any additional configurations for the Vnet peering here

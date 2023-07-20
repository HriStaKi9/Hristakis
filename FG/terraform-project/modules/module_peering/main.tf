# modules/vnet_peering/main.tf

variable "vnet1_name" {
  description = "Name of the first VNet"
}

variable "vnet1_rg" {
  description = "Resource group of the first VNet"
}

variable "vnet2_name" {
  description = "Name of the second VNet"
}

variable "vnet2_rg" {
  description = "Resource group of the second VNet"
}

resource "azurerm_virtual_network_peering" "peering_vnet1_to_vnet2" {
  name                         = "vnet1-to-vnet2"
  resource_group_name          = var.vnet1_rg
  virtual_network_name         = var.vnet1_name
  remote_virtual_network_id    = azurerm_virtual_network.vnet2.id
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "peering_vnet2_to_vnet1" {
  name                         = "vnet2-to-vnet1"
  resource_group_name          = var.vnet2_rg
  virtual_network_name         = var.vnet2_name
  remote_virtual_network_id    = azurerm_virtual_network.vnet1.id
  allow_virtual_network_access = true
}

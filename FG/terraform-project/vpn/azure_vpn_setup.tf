provider "azurerm" {
  features {}
}

resource "azurerm_virtual_network" "onprem_vnet" {
  name                = "OnPremisesVNet"
  address_space       = ["10.0.0.0/16"]
  location            = "East US"
}

resource "azurerm_subnet" "gateway_subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.your_rg.name
  virtual_network_name = azurerm_virtual_network.onprem_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_virtual_network_gateway" "vpn_gateway" {
  name                = "OnPremisesVpnGateway"
  resource_group_name = azurerm_resource_group.your_rg.name
  location            = "East US"
  type                = "Vpn"
  vpn_type            = "RouteBased"
  sku                 = "VpnGw1"
  gateway_subnet_id   = azurerm_subnet.gateway_subnet.id

  vpn_client_configuration {
    address_space = ["192.168.0.0/24"]
  }
}

resource "azurerm_virtual_network_gateway_connection" "vpn_connection" {
  name                      = "OnPremisesVpnConnection"
  resource_group_name       = azurerm_resource_group.your_rg.name
  virtual_network_gateway_id = azurerm_virtual_network_gateway.vpn_gateway.id
  location                  = "East US"
  connection_type           = "IPsec"
  shared_key                = "YourSharedKeyHere"

  local_network_gateway_id = "YourOnPremisesGatewayID"

  depends_on = [
    azurerm_virtual_network_gateway.vpn_gateway,
  ]
}

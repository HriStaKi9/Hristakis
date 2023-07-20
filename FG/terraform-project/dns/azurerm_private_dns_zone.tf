resource "azurerm_private_dns_zone" "forwarder_dns_zone" {
  name                = "example.com"  # Replace with your desired DNS zone name
  resource_group_name = azurerm_resource_group.your_rg.name
  location            = "East US"      # Replace with your desired region
}
resource "azurerm_private_dns_zone_virtual_network_link" "forwarder_dns_link" {
  name                = "forwarder-dns-link"
  resource_group_name = azurerm_resource_group.your_rg.name
  private_dns_zone_id = azurerm_private_dns_zone.forwarder_dns_zone.id
  virtual_network_id  = azurerm_virtual_network.your_vnet.id
}

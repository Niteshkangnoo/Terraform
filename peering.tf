resource "azurerm_virtual_network_peering" "peeringconnection1" {
  name                      = "easttowest"
  resource_group_name       = azurerm_resource_group.appgrp.name
  virtual_network_name      = azurerm_virtual_network.tfvnet.name
  remote_virtual_network_id = azurerm_virtual_network.testvnet.id
  depends_on                = [azurerm_virtual_network.testvnet, azurerm_virtual_network.tfvnet]
}

resource "azurerm_virtual_network_peering" "peeringconnection2" {
  name                      = "westtoeast"
  resource_group_name       = azurerm_resource_group.testrg.name
  virtual_network_name      = azurerm_virtual_network.testvnet.name
  remote_virtual_network_id = azurerm_virtual_network.tfvnet.id
  depends_on                = [azurerm_virtual_network.testvnet, azurerm_virtual_network.tfvnet, azurerm_virtual_network_peering.peeringconnection1]
}


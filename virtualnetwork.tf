resource "azurerm_virtual_network" "tfvnet" {
  name                = "tfvnet"
  location            = azurerm_resource_group.appgrp.location
  resource_group_name = azurerm_resource_group.appgrp.name
  address_space       = ["10.0.0.0/8"]
  depends_on          = [azurerm_resource_group.appgrp]
}
resource "azurerm_subnet" "tfsubnet" {
  name                 = "tfsubnet"
  address_prefixes     = ["10.0.1.0/24"]
  resource_group_name  = azurerm_resource_group.appgrp.name
  virtual_network_name = azurerm_virtual_network.tfvnet.name
  depends_on           = [azurerm_network_security_group.tfnsg]
}

resource "azurerm_subnet" "AzureFirewallSubnet" {
  name                 = "AzureFirewallSubnet"
  address_prefixes     = ["10.0.2.0/24"]
  resource_group_name  = azurerm_resource_group.appgrp.name
  virtual_network_name = azurerm_virtual_network.tfvnet.name
  depends_on           = [azurerm_network_security_group.tfnsg]
}

resource "azurerm_subnet_network_security_group_association" "tfsubnetnsgasocation" {
  subnet_id                 = azurerm_subnet.tfsubnet.id
  network_security_group_id = azurerm_network_security_group.tfnsg.id
  depends_on                = [azurerm_network_security_group.tfnsg]
}
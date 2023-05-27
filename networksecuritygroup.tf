resource "azurerm_network_security_group" "tfnsg" {
  name                = "tfnsg"
  location            = azurerm_resource_group.appgrp.location
  resource_group_name = azurerm_resource_group.appgrp.name
  depends_on          = [azurerm_resource_group.appgrp]
}

resource "azurerm_network_security_group" "testnsg" {
  name                = "testnsg"
  location            = azurerm_resource_group.testrg.location
  resource_group_name = azurerm_resource_group.testrg.name
  depends_on          = [azurerm_resource_group.testrg ]
}
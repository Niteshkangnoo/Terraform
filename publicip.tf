resource "azurerm_public_ip" "tf-fw-pip" {
  name                = "tf-fw-pip"
  location            = azurerm_resource_group.appgrp.location
  resource_group_name = azurerm_resource_group.appgrp.name
  allocation_method   = "Static"
  sku                 = "Standard"
  depends_on          = [azurerm_subnet.AzureFirewallSubnet]
}
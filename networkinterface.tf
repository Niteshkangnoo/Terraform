resource "azurerm_network_interface" "tfvm-nic" {
  name                = "${var.prefix}-vmnic"
  location            = azurerm_resource_group.appgrp.location
  resource_group_name = azurerm_resource_group.appgrp.name

  ip_configuration {
    name                          = "tfconfiguration"
    subnet_id                     = azurerm_subnet.tfsubnet.id
    private_ip_address_allocation = "Dynamic"

  }
  depends_on = [azurerm_subnet.tfsubnet]

}

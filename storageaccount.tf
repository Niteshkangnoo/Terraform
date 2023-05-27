resource "random_integer" "randomno" {
  min        = 1
  max        = 400
  depends_on = [azurerm_resource_group.appgrp]
}


resource "azurerm_storage_account" "tfstrgaccnt" {
  name                     = "tfstrgaccnt${lower(random_integer.randomno.result)}"
  resource_group_name      = azurerm_resource_group.appgrp.name
  location                 = azurerm_resource_group.appgrp.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on               = [random_integer.randomno]
}
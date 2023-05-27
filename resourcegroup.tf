resource "azurerm_resource_group" "appgrp" {
  name     = "app-grp"
  location = "eastus"
  tags     = local.tags
}

resource "azurerm_resource_group" "testrg" {
  name     = "testrg"
  location = "westus"
  tags     = local.tags
}



resource "azurerm_resource_group" "appgrp" {
  name     = "app-grp"
  location = "eastus"
  tags     = local.tags
}





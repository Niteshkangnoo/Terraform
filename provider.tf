terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.57.0"
    }
  }

  backend "azurerm" {
  resource_group_name = "appgrp"
  storage_account_name = "tfstrgaccnt113"
  container_name = "tfstate"
  key = "terraform.tfstate"
  #sas_token = "SAS_token_value"
}

}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}



resource "azurerm_firewall_policy" "tffwpolicy" {
  name                = "tffwpolicy"
  resource_group_name = azurerm_resource_group.appgrp.name
  location            = azurerm_resource_group.appgrp.location
  depends_on = [ azurerm_resourceex_group.appgrp ]
}

resource "azurerm_firewall_policy_rule_collection_group" "tffwpolrcg" {
  name               = "tffwpolrcg"
  firewall_policy_id = azurerm_firewall_policy.tffwpolicy.id
  priority           = 100

  nat_rule_collection {
    name     = "nat_rule_collection1"
    priority = 100
    action   = "Dnat"
    rule {
      name                = "tfrdpnat"
      protocols           = ["TCP"]
      source_addresses    = ["*"]
      destination_address = azurerm_public_ip.tf-fw-pip.ip_address
      destination_ports   = ["50"]
      translated_address  = "10.0.1.4"
      translated_port     = "3389"
    }
  }
  depends_on = [ azurerm_firewall_policy.tffwpolicy ]
}



resource "azurerm_firewall" "tf-fw" {
  name                = "tf-fw"
  location            = azurerm_resource_group.appgrp.location
  resource_group_name = azurerm_resource_group.appgrp.name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"
  firewall_policy_id = azurerm_firewall_policy.tffwpolicy.id
  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.AzureFirewallSubnet.id
    public_ip_address_id = azurerm_public_ip.tf-fw-pip.id
  }
  
  depends_on         = [azurerm_subnet.AzureFirewallSubnet]
}
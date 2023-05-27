resource "azurerm_route_table" "tf-rt" {
  name                          = "tf-rt"
  location                      = azurerm_resource_group.appgrp.location
  resource_group_name           = azurerm_resource_group.appgrp.name
  disable_bgp_route_propagation = false

  route {
    name                   = "Internet"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.0.2.4"
  }

  route {
    name                   = "RFC-1918-10"
    address_prefix         = "10.0.0.0/8"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.0.2.4"
  }

  route {
    name                   = "RFC-1918-172"
    address_prefix         = "172.16.0.0/12"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.0.2.4"
  }

  route {
    name                   = "RFC-1918-192"
    address_prefix         = "192.168.0.0/16"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.0.2.4"
  }

  depends_on = [azurerm_resource_group.appgrp]
}


resource "azurerm_subnet_route_table_association" "tf-rt-tfsubnet" {
  subnet_id      = azurerm_subnet.tfsubnet.id
  route_table_id = azurerm_route_table.tf-rt.id
  depends_on     = [azurerm_subnet.tfsubnet]
}
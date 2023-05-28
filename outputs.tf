output "firewall_public_ip" {
  value       = azurerm_public_ip.tf-fw-pip.ip_address
  description = "Firewall's public ip address"
}


output "virtual_network_id" {
  value = data.azurerm_virtual_network.portal-vnet.id
}
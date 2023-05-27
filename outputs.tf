output "firewall_public_ip" {
    value = azurerm_public_ip.tf-fw-pip.ip_address
    description = "Firewall's public ip address"
}
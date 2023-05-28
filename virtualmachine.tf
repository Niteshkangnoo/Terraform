# Uncomment this line to delete the OS disk automatically when deleting the VM
# delete_os_disk_on_termination = true

# Uncomment this line to delete the data disks automatically when deleting the VM
# delete_data_disks_on_termination = true

resource "azurerm_windows_virtual_machine" "tfvm" {
  name                = "${var.prefix}-vm01"
  resource_group_name = azurerm_resource_group.appgrp.name
  location            = azurerm_resource_group.appgrp.location
  size                = "Standard_DS1_v2"
  admin_username      = "testadmin"
  admin_password      = "Password@123"
  network_interface_ids = [
    azurerm_network_interface.tfvm-nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  depends_on = [azurerm_resource_group.appgrp]
}


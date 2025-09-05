resource "azurerm_linux_virtual_machine" "vm" {
    for_each = var.vm
  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = "Standard_F2"
  admin_username      = each.value.username
  admin_password      = each.value.password
  disable_password_authentication = false
  network_interface_ids = [
    data.azurerm_network_interface.nic1[each.key].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  #   custom_data = base64encode(<<-EOF
  #   #!/bin/bash
  #   apt-get update -y
  #   apt-get install -y nginx
  #   systemctl enable nginx
  #   systemctl start nginx
  # EOF
  # )
  custom_data = base64encode(each.value.custom_data)

}
resource "azurerm_network_interface_backend_address_pool_association" "nic_association" {
    for_each = var.nic_association
  network_interface_id    = data.azurerm_network_interface.data_nic[each.key].id
  ip_configuration_name   = "internal"
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.data_backend_pool[each.key].id
}


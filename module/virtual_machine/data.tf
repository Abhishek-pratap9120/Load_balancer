data "azurerm_network_interface" "nic1" {
    for_each = var.vm
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}
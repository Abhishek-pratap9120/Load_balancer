resource "azurerm_virtual_network" "virtual_network" {
    for_each = var.virtual_network
  name                = each.value.virtual_network_name
  location            = each.value.virtual_network_location
  resource_group_name = each.value.rg_name
  address_space       = each.value.address_space
}
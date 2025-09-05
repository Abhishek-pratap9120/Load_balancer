resource "azurerm_lb" "load_b" {
    for_each = var.load_balancer
  name                = each.value.lb_name
  location            = each.value.lb_location
  resource_group_name = each.value.rg_name

  frontend_ip_configuration {
    name                 = each.value.ipconfig_name
    public_ip_address_id = data.azurerm_public_ip.data_pip[each.key].id
  }
}
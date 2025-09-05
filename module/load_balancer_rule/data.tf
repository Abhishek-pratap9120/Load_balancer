data "azurerm_lb" "data_lb" {
    for_each = var.lb_rule
  name                = each.value.lb_name
  resource_group_name = each.value.rg_name
}
data "azurerm_lb_backend_address_pool" "data_backend_pool" {
    for_each = var.lb_rule
  name            = each.value.backendpool_name
  loadbalancer_id = data.azurerm_lb.data_lb[each.key].id
}

# data "azurerm_lb_probe" "data_probe" {
#     for_each = var.lb_rule
#   name                = each.value.health_probe_name
#   resource_group_name = each.value.rg_name
#   loadbalancer_id     = data.azurerm_lb.data_lb[each.key].id
# }
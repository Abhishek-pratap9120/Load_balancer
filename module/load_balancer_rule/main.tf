resource "azurerm_lb_rule" "lb_rule" {
    for_each = var.lb_rule
  name                           = each.value.lb_rule_name
  loadbalancer_id                = data.azurerm_lb.data_lb[each.key].id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = each.value.ipconfig_name
  backend_address_pool_ids       = [data.azurerm_lb_backend_address_pool.data_backend_pool[each.key].id]
#   probe_id                       = data.azurerm_lb_probe.data_probe[each.key].id
}
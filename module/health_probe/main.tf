resource "azurerm_lb_probe" "health_probe" {
    for_each = var.health_probe
  name                = each.value.health_probe_name
  loadbalancer_id     = data.azurerm_lb.data_lb[each.key].id
  protocol            = "Http"
  port                = 80
  request_path        = "/"
}


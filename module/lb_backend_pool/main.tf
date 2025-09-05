resource "azurerm_lb_backend_address_pool" "lb_backend_pool" {
    for_each = var.backend_pool
  loadbalancer_id = data.azurerm_lb.data_lb[each.key].id
  name            = each.value.backendpool_name
}


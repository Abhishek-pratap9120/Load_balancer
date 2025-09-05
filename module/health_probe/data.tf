data "azurerm_lb" "data_lb" {
    for_each = var.health_probe
  name                = each.value.lb_name
  resource_group_name = each.value.rg_name
}
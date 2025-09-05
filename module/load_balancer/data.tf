data "azurerm_public_ip" "data_pip" {
    for_each = var.load_balancer
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}
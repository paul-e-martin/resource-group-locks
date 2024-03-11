# resource group
data "azurerm_resource_group" "rg" {
  provider = azurerm.landingzone
  for_each = {
    for rg in try(data.terraform_remote_state.remotes.outputs.resource_groups, []) : rg.name => rg if split("/", rg.id)[2] == var.landing_zone_subscription_id
  }
  name = each.value.name
}

# resource group lock
resource "azurerm_management_lock" "lock" {
  provider   = azurerm.landingzone
  for_each   = data.azurerm_resource_group.rg
  name       = "${each.value.name}-lock"
  scope      = each.value.id
  lock_level = var.lock_level
  notes      = "Resource group '${each.value.name}' is locked with '${var.lock_level}' level lock."
}

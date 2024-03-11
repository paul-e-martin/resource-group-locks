data "terraform_remote_state" "remotes" {
  backend = "azurerm"
  config = {
    subscription_id      = var.subscription_id
    resource_group_name  = var.resource_group_name
    storage_account_name = var.storage_account_name
    container_name       = var.container_name
    key                  = var.key
  }
}

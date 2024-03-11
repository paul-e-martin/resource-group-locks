output "terraform_module" {
  description = "Information about this Terraform module"
  value = {
    name     = "azurerm_resource_group"
    version  = file("${path.module}/VERSION")
    provider = "azurerm"
  }
}

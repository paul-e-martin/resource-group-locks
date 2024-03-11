# azurerm_resource_group

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.7.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.74.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azurerm_resource_group_locks___landing_zone_subscription_id__"></a> [azurerm\_resource\_group\_locks\_\_\_landing\_zone\_subscription\_id\_\_](#module\_azurerm\_resource\_group\_locks\_\_\_landing\_zone\_subscription\_id\_\_) | ./modules/resource-group-locks | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | n/a | `string` | n/a | yes |
| <a name="input_key"></a> [key](#input\_key) | n/a | `string` | n/a | yes |
| <a name="input_lock_level"></a> [lock\_level](#input\_lock\_level) | lock level for the resource group | `string` | `"CanNotDelete"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | n/a | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_terraform_module"></a> [terraform\_module](#output\_terraform\_module) | Information about this Terraform module |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

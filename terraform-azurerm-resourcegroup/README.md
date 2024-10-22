<!-- BEGIN_TF_DOCS -->
# Azure Resource Group Module
- This is the terraform to create a Resource Group using modules which provides a flexible way to set its name based on specified variables.

## Introduction
- Managing resources in Azure efficiently often requires using resource group with standardized naming conventions.
- This Terraform module helps in automating the creation of Azure Resource Group with a consistent naming pattern.
- By using this module, you can ensure that your resource groups are named correctly based on the environment, project, and region.
- This module is designed to be integrated easily into your CI/CD pipelines, making it simple to manage your infrastructure as code.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.6.6 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.42.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 2.42.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) custom variable. This is the environment name where the resource group will be created. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Required) The Azure Region where the Resource Group should exist. changing this forces  a new Resource Group to be created | `string` | n/a | yes |
| <a name="input_main_project"></a> [main\_project](#input\_main\_project) | (Required) custom variable. main project name | `string` | n/a | yes |
| <a name="input_sub_project"></a> [sub\_project](#input\_sub\_project) | (Required) custom variable. sub project name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags which should be assigned to the Resource Group | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The id of the resource group |
| <a name="output_name"></a> [name](#output\_name) | The name of the resource group |
<!-- END_TF_DOCS -->
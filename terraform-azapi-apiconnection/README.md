<!-- BEGIN_TF_DOCS -->
# Azure API Connection Module

A module to deploy Azure API Connection resources.
Includes pre-defined API details for a number of commonly used API connections as well as the ability to grant other resources access to the connection.

## Supported APIs

The following APIs are supported by the module using the `api_type` variable.
Other API connection types must pass a definition to `custom_api_field`.
* `excelonlinebusiness`
* `office365`
* `sharepointonline`
* `teams`
* `wordonlinebusiness`

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | 1.15.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.6.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azapi_resource.api_connection](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource) | resource |
| [azapi_resource.api_connection_access](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource) | resource |
| [null_resource.api_connection](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.api_connection_access](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [azurerm_managed_api.managed_api](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/managed_api) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_type"></a> [api\_type](#input\_api\_type) | Type of API connection to create, eg sharepoint, wordonline, etc. | `string` | n/a | yes |
| <a name="input_connection_user"></a> [connection\_user](#input\_connection\_user) | User to populate the API connection with. Changing will not trigger resource replacement. | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | ID of the resource group to deploy the API connection to. | `string` | n/a | yes |
| <a name="input_custom_api_field"></a> [custom\_api\_field](#input\_custom\_api\_field) | 'api' field object for API types not pre-populated for the module. | `map(string)` | `{}` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Name of the environment being deployed, ie dev/test/preprod/live/etc. | `string` | `"dev"` | no |
| <a name="input_location"></a> [location](#input\_location) | Location to deploy the resources. Should not be changed for HO resources unless needed. | `string` | `"UK South"` | no |
| <a name="input_principal_ids"></a> [principal\_ids](#input\_principal\_ids) | Map of names and principal IDs of apps to allow access to the API connection. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to add to resource. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_id"></a> [connection\_id](#output\_connection\_id) | n/a |
| <a name="output_connection_runtime_url"></a> [connection\_runtime\_url](#output\_connection\_runtime\_url) | n/a |

## Test Cases

The test cases for this repo are stored in `tests/tests.tftest.hcl`.
Current features tested:
* Generation of API Connection and existence of a valid connection runtime URL.
* Access policy granting access to a logic app using a system assigned identity.

To run tests locally run `terraform init` and then `terraform test` in the root directory

When running the tests locally if you encounter issues authenticating the `azapi` provider, try setting the following environment variables:
* `ARM_USE_CLI = "true"`
* `ARM_USE_MSI = "false"`
<!-- END_TF_DOCS -->
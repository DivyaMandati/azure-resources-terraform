<!-- BEGIN_TF_DOCS -->
# DNS Zone Module
- This Folder contains a module for creating DNS related resources in Azure. The module can be used to create public and private DNS Zones and Records. Currently for Private zones SOA, A and CNAME records are supported. Public Zones support SOA, A, CNAME and NS.

## Module Usage
- This module can be used to spin up a public/private dns zone with optional records and vnet linkage (private zone only).

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
| [azurerm_dns_a_record.records_a_public](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_a_record) | resource |
| [azurerm_dns_cname_record.records_cname_public](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_cname_record) | resource |
| [azurerm_dns_ns_record.records_ns_public](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_ns_record) | resource |
| [azurerm_dns_zone.dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone) | resource |
| [azurerm_private_dns_a_record.records_a_private](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record) | resource |
| [azurerm_private_dns_cname_record.records_cname_private](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_cname_record) | resource |
| [azurerm_private_dns_zone.private_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.private_dns_vnet_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_zone_name"></a> [dns\_zone\_name](#input\_dns\_zone\_name) | (Required) domain name for DNS zone. Changing this forces a new DNS Zone to be created | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) custom variable. This is the environment name where the DNS Zone will be created. Changing this forces a new DNS Zone to be created. | `string` | n/a | yes |
| <a name="input_main_project"></a> [main\_project](#input\_main\_project) | (Required) custom variable. main project name. Changing this forces a new DNS Zone to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group for the DNS Zone. Changing this forces a new DNS Zone to be created | `string` | n/a | yes |
| <a name="input_sub_project"></a> [sub\_project](#input\_sub\_project) | (Required) custom variable. sub project name. Changing this forces a new DNS Zone to be created. | `string` | n/a | yes |
| <a name="input_zone_type"></a> [zone\_type](#input\_zone\_type) | (Required) Flag for determining if DNS resources will be public or private | `string` | n/a | yes |
| <a name="input_a_records"></a> [a\_records](#input\_a\_records) | (Optional) List of a records to be added in DNS Zone. | <pre>list(object({<br/>    name    = string<br/>    ttl     = number<br/>    records = list(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_cname_records"></a> [cname\_records](#input\_cname\_records) | (Optional) List of cname records to be added in DNS Zone. | <pre>list(object({<br/>    name   = string<br/>    ttl    = number<br/>    record = string<br/>  }))</pre> | `[]` | no |
| <a name="input_dns_zone_resource_prefix"></a> [dns\_zone\_resource\_prefix](#input\_dns\_zone\_resource\_prefix) | (Static) resource specific prefix for standard naming convention | `string` | `"dns-zone"` | no |
| <a name="input_link_private_zone_to_vnet"></a> [link\_private\_zone\_to\_vnet](#input\_link\_private\_zone\_to\_vnet) | (Optional) Flag for enabling private dns zone link to existing virtual network | `bool` | `false` | no |
| <a name="input_ns_records"></a> [ns\_records](#input\_ns\_records) | (Optional) List of ns records to be added in DNS Zone. | <pre>list(object({<br/>    name    = string,<br/>    ttl     = number,<br/>    records = list(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_private_dns_zone_name_prefix"></a> [private\_dns\_zone\_name\_prefix](#input\_private\_dns\_zone\_name\_prefix) | (Static) prefix for private DNS Zone name | `string` | `"privatelink"` | no |
| <a name="input_private_dns_zone_resource_prefix"></a> [private\_dns\_zone\_resource\_prefix](#input\_private\_dns\_zone\_resource\_prefix) | (Static) resource specific prefix for standard naming convention | `string` | `"private-dns-zone"` | no |
| <a name="input_private_registration_enabled"></a> [private\_registration\_enabled](#input\_private\_registration\_enabled) | (Optional) Is auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled? | `bool` | `false` | no |
| <a name="input_soa_record"></a> [soa\_record](#input\_soa\_record) | (Optional) Customize details about the root block device of the DNS Zone. | <pre>list(object({<br/>    email         = string<br/>    expire_time   = number<br/>    minimum_ttl   = number<br/>    refresh_time  = number<br/>    retry_time    = number<br/>    serial_number = optional(number, null)<br/>    ttl           = number<br/>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags which should be assigned to the DNS Zone | `map(string)` | `{}` | no |
| <a name="input_virtual_network_id"></a> [virtual\_network\_id](#input\_virtual\_network\_id) | (Optional) The ID of the virtual network for linking a private DNS Zone | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_a_record_fqdns"></a> [dns\_a\_record\_fqdns](#output\_dns\_a\_record\_fqdns) | A mapping of Public DNS A Record names to their FQDNs. |
| <a name="output_dns_a_record_ids"></a> [dns\_a\_record\_ids](#output\_dns\_a\_record\_ids) | A mapping of Public DNS A Record names to their IDs. |
| <a name="output_dns_cname_record_fqdns"></a> [dns\_cname\_record\_fqdns](#output\_dns\_cname\_record\_fqdns) | A mapping of Public DNS CNAME Record names to their FQDNs. |
| <a name="output_dns_cname_record_ids"></a> [dns\_cname\_record\_ids](#output\_dns\_cname\_record\_ids) | A mapping of Public DNS CNAME Record names to their IDs. |
| <a name="output_dns_ns_record_fqdns"></a> [dns\_ns\_record\_fqdns](#output\_dns\_ns\_record\_fqdns) | A mapping of Public DNS NS Record names to their FQDNs. |
| <a name="output_dns_ns_record_ids"></a> [dns\_ns\_record\_ids](#output\_dns\_ns\_record\_ids) | A mapping of Public DNS NS Record names to their IDs. |
| <a name="output_dns_zone_id"></a> [dns\_zone\_id](#output\_dns\_zone\_id) | The Public DNS Zone ID. |
| <a name="output_dns_zone_max_number_of_record_sets"></a> [dns\_zone\_max\_number\_of\_record\_sets](#output\_dns\_zone\_max\_number\_of\_record\_sets) | The maximum number of Records in the Public DNS zone. |
| <a name="output_dns_zone_name"></a> [dns\_zone\_name](#output\_dns\_zone\_name) | The Public DNS Zone name. |
| <a name="output_dns_zone_number_of_record_sets"></a> [dns\_zone\_number\_of\_record\_sets](#output\_dns\_zone\_number\_of\_record\_sets) | The number of records already in the Public DNS zone. |
| <a name="output_private_dns_a_record_fqdns"></a> [private\_dns\_a\_record\_fqdns](#output\_private\_dns\_a\_record\_fqdns) | A mapping of Private DNS A Record names to their FQDNs. |
| <a name="output_private_dns_a_record_ids"></a> [private\_dns\_a\_record\_ids](#output\_private\_dns\_a\_record\_ids) | A mapping of Private DNS A Record names to their IDs. |
| <a name="output_private_dns_cname_record_fqdns"></a> [private\_dns\_cname\_record\_fqdns](#output\_private\_dns\_cname\_record\_fqdns) | A mapping of Private DNS CNAME Record names to their FQDNs. |
| <a name="output_private_dns_cname_record_ids"></a> [private\_dns\_cname\_record\_ids](#output\_private\_dns\_cname\_record\_ids) | A mapping of Private DNS CNAME Record names to their IDs. |
| <a name="output_private_dns_zone_id"></a> [private\_dns\_zone\_id](#output\_private\_dns\_zone\_id) | The Private DNS Zone ID. |
| <a name="output_private_dns_zone_max_number_of_record_sets"></a> [private\_dns\_zone\_max\_number\_of\_record\_sets](#output\_private\_dns\_zone\_max\_number\_of\_record\_sets) | The maximum number of Records in the Private DNS zone. |
| <a name="output_private_dns_zone_name"></a> [private\_dns\_zone\_name](#output\_private\_dns\_zone\_name) | The Private DNS Zone name. |
| <a name="output_private_dns_zone_number_of_record_sets"></a> [private\_dns\_zone\_number\_of\_record\_sets](#output\_private\_dns\_zone\_number\_of\_record\_sets) | The number of records in the Private DNS zone. |
| <a name="output_private_dns_zone_virtual_network_link_id"></a> [private\_dns\_zone\_virtual\_network\_link\_id](#output\_private\_dns\_zone\_virtual\_network\_link\_id) | The ID of the Private DNS Zone Virtual Network Link. |

# Test Cases

- There are 6 test cases covered in this repo. See `tests/tests.tftest.hcl`
- To run tests locally run `terraform init` and then `terraform test` in the root directory

TODO: add more test details here
<!-- END_TF_DOCS -->
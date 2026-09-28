# terraform-azurerm-caf-express_route_gateway

Deploys an Azure ExpressRoute Gateway within a Virtual Hub (`azurerm_express_route_gateway`),
covering scale units and non-Virtual-WAN traffic acceptance. Requires azurerm
`>= 4.9.0, < 6.0.0`.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.9.0, < 6.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 5.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_express_route_gateway.express_route_gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/express_route_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env) | (Required) Environment for the ExpressRoute Gateway | `string` | n/a | yes |
| <a name="input_express_route_gateway"></a> [express\_route\_gateway](#input\_express\_route\_gateway) | ExpressRoute Gateway object containing all parameters. Supported properties include:<br/>  - resource\_group (Required): key in resource\_groups map, or a full resource group ID<br/>  - virtual\_hub\_id (Required): the ID of the Virtual Hub within which this ExpressRoute Gateway should be created<br/>  - scale\_units (Required): number of scale units to provision (each = 2Gbps, up to 10 = 20Gbps)<br/>  - allow\_non\_virtual\_wan\_traffic (Optional): defaults to false<br/>  - tags (Optional) | `any` | `{}` | no |
| <a name="input_group"></a> [group](#input\_group) | (Required) Group for the project | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Required) specifies the Azure location where the resource exists | `string` | `"canadacentral"` | no |
| <a name="input_project"></a> [project](#input\_project) | (Required) Project name | `string` | n/a | yes |
| <a name="input_resource_groups"></a> [resource\_groups](#input\_resource\_groups) | (Required) Resource group object for the ExpressRoute Gateway | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for the resources | `map(string)` | `{}` | no |
| <a name="input_userDefinedString"></a> [userDefinedString](#input\_userDefinedString) | (Required) UserDefinedString for the ExpressRoute Gateway | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_express_route_gateway_id"></a> [express\_route\_gateway\_id](#output\_express\_route\_gateway\_id) | Outputs the id of the ExpressRoute Gateway |
| <a name="output_express_route_gateway_name"></a> [express\_route\_gateway\_name](#output\_express\_route\_gateway\_name) | Outputs the name of the ExpressRoute Gateway |
| <a name="output_express_route_gateway_object"></a> [express\_route\_gateway\_object](#output\_express\_route\_gateway\_object) | Outputs the entire ExpressRoute Gateway object |
<!-- END_TF_DOCS -->
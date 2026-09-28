resource "azurerm_express_route_gateway" "express_route_gateway" {
  name                = local.express_route_gateway_name
  resource_group_name = local.resource_group_name
  location            = var.location
  virtual_hub_id      = var.express_route_gateway.virtual_hub_id
  scale_units         = var.express_route_gateway.scale_units

  # Optional top-level parameters
  allow_non_virtual_wan_traffic = try(var.express_route_gateway.allow_non_virtual_wan_traffic, false)

  tags = merge(var.tags, try(var.express_route_gateway.tags, {}))
}

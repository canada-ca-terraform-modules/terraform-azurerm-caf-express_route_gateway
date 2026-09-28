output "express_route_gateway_object" {
  description = "Outputs the entire ExpressRoute Gateway object"
  value       = azurerm_express_route_gateway.express_route_gateway
}

output "express_route_gateway_id" {
  description = "Outputs the id of the ExpressRoute Gateway"
  value       = azurerm_express_route_gateway.express_route_gateway.id
}

output "express_route_gateway_name" {
  description = "Outputs the name of the ExpressRoute Gateway"
  value       = azurerm_express_route_gateway.express_route_gateway.name
}

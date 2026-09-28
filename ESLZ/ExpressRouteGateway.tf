variable "express_route_gateways" {
  description = "Map of ExpressRoute Gateway configurations. Each key becomes the userDefinedString."
  type        = any
  default     = {}
}

module "express_route_gateway" {
  source   = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-express_route_gateway?ref=v1.0.0"
  for_each = var.express_route_gateways

  env               = var.env
  group             = var.group
  project           = var.project
  userDefinedString = each.key
  location          = var.location
  tags              = local.tags
  resource_groups   = local.resource_groups

  express_route_gateway = each.value
}

variable "env" {
  description = "(Required) Environment for the ExpressRoute Gateway"
  type        = string
}

variable "group" {
  description = "(Required) Group for the project"
  type        = string
}

variable "project" {
  description = "(Required) Project name"
  type        = string
}

variable "userDefinedString" {
  description = "(Required) UserDefinedString for the ExpressRoute Gateway"
  type        = string
}

variable "location" {
  description = "(Required) specifies the Azure location where the resource exists"
  type        = string
  default     = "canadacentral"
}

variable "resource_groups" {
  description = "(Required) Resource group object for the ExpressRoute Gateway"
  type        = any
}

variable "express_route_gateway" {
  description = <<EOT
ExpressRoute Gateway object containing all parameters. Supported properties include:
  - resource_group (Required): key in resource_groups map, or a full resource group ID
  - virtual_hub_id (Required): the ID of the Virtual Hub within which this ExpressRoute Gateway should be created
  - scale_units (Required): number of scale units to provision (each = 2Gbps, up to 10 = 20Gbps)
  - allow_non_virtual_wan_traffic (Optional): defaults to false
  - tags (Optional)
EOT
  type        = any
  default     = {}
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default     = {}
}

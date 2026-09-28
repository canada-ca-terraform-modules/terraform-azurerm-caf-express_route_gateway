express_route_gateways = {
  example = {
    resource_group = "Project" # key in resource_groups map, or full Azure resource ID

    # Required: ID of the Virtual Hub (within a Virtual WAN) this gateway attaches to
    virtual_hub_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-proj/providers/Microsoft.Network/virtualHubs/example-hub"

    # Required: number of scale units to provision. Each unit = 2Gbps, up to 10 (20Gbps)
    scale_units = 1

    # Optional: allow traffic from non-Virtual WAN networks. Defaults to false
    # allow_non_virtual_wan_traffic = true

    # Optional: tags merged with the caller's tags
    # tags = {
    #   foo = "bar"
    # }
  }
}

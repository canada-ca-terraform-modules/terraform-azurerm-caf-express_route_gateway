mock_provider "azurerm" {}

variables {
  env               = "Dev"
  group             = "SLRD"
  project           = "test"
  userDefinedString = "gw"
  location          = "canadacentral"
  resource_groups = {
    Project = { name = "rg-proj", id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-proj" }
  }
  tags = { environment = "dev" }
}

# ─── naming_convention ──────────────────────────────────────────────────────
run "naming_convention" {
  command = plan

  variables {
    express_route_gateway = {
      resource_group = "Project"
      virtual_hub_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-proj/providers/Microsoft.Network/virtualHubs/example-hub"
      scale_units    = 1
    }
  }

  assert {
    condition     = azurerm_express_route_gateway.express_route_gateway.name == "dev-slrd-test-gw-ergw"
    error_message = "Name must follow {env4}-{group}-{project}-{userDefinedString}-ergw convention"
  }
}

# ─── default_values ─────────────────────────────────────────────────────────
run "default_values" {
  command = plan

  variables {
    express_route_gateway = {
      resource_group = "Project"
      virtual_hub_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-proj/providers/Microsoft.Network/virtualHubs/example-hub"
      scale_units    = 1
    }
  }

  assert {
    condition     = azurerm_express_route_gateway.express_route_gateway.location == "canadacentral"
    error_message = "Default location must apply when not overridden"
  }

  assert {
    condition     = azurerm_express_route_gateway.express_route_gateway.allow_non_virtual_wan_traffic == false
    error_message = "Default allow_non_virtual_wan_traffic must be false"
  }
}

# ─── custom_scale_and_traffic ────────────────────────────────────────────────
run "custom_scale_and_traffic" {
  command = plan

  variables {
    express_route_gateway = {
      resource_group                = "Project"
      virtual_hub_id                = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-proj/providers/Microsoft.Network/virtualHubs/example-hub"
      scale_units                   = 3
      allow_non_virtual_wan_traffic = true
    }
  }

  assert {
    condition     = azurerm_express_route_gateway.express_route_gateway.scale_units == 3
    error_message = "scale_units override must apply"
  }

  assert {
    condition     = azurerm_express_route_gateway.express_route_gateway.allow_non_virtual_wan_traffic == true
    error_message = "allow_non_virtual_wan_traffic override must apply"
  }
}

# ─── resource_group_by_id ───────────────────────────────────────────────────
run "resource_group_by_id" {
  command = plan

  variables {
    express_route_gateway = {
      resource_group = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-direct"
      virtual_hub_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-proj/providers/Microsoft.Network/virtualHubs/example-hub"
      scale_units    = 1
    }
  }

  assert {
    condition     = azurerm_express_route_gateway.express_route_gateway.resource_group_name == "rg-direct"
    error_message = "Full resource ID must resolve to the resource group name"
  }
}

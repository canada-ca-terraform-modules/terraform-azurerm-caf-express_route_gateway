# test_dependencies.tf
# Self-contained dependency resources, owned entirely by this harness.
#
# Deliberately NOT reusing any shared/production resource group/hub: writing
# into shared infra usually requires elevated, non-sandbox permissions. A
# dedicated throwaway RG + Virtual WAN + Virtual Hub here needs only
# Contributor on the sandbox subscription and can never collide with or
# affect any production resource.
#
# terraform-azurerm-caf-express_route_gateway needs a resource group (keyed
# map, var.resource_groups) plus a Virtual Hub (within a Virtual WAN) to
# attach to - the gateway resource has no other dependencies.

resource "azurerm_resource_group" "live_test" {
  # PR-number suffix keeps two concurrently open PRs against this module
  # from colliding on the same sandbox resources.
  name     = "${var.env}-caf-ergw-live-test-${var.pr_number}-rg"
  location = var.location

  # pr-number tag: lets the nightly orphan sweeper find this RG by tag and
  # match it back to a PR, independent of naming convention.
  # repository tag: the sandbox subscription is shared across module repos,
  # so the sweeper must scope its `pr-number` matches to only this repo's
  # own PRs - otherwise a PR number collision across repos could
  # misclassify (or destroy) another repo's live resource group.
  tags = merge(var.tags, {
    "pr-number"  = var.pr_number
    "repository" = var.repository
  })
}

resource "azurerm_virtual_wan" "live_test" {
  name                = "${var.env}-caf-ergw-live-test-${var.pr_number}-vwan"
  resource_group_name = azurerm_resource_group.live_test.name
  location            = azurerm_resource_group.live_test.location

  tags = var.tags
}

resource "azurerm_virtual_hub" "live_test" {
  name                = "${var.env}-caf-ergw-live-test-${var.pr_number}-vhub"
  resource_group_name = azurerm_resource_group.live_test.name
  location            = azurerm_resource_group.live_test.location
  virtual_wan_id      = azurerm_virtual_wan.live_test.id
  address_prefix      = "10.0.0.0/24"

  tags = var.tags
}

locals {
  # Keyed map matching terraform-azurerm-caf-express_route_gateway's expected
  # shape: var.resource_groups[var.express_route_gateway.resource_group].name
  resource_groups = { live_test = { name = azurerm_resource_group.live_test.name } }
}

# config/express_route_gateway.tfvars
# Tracked, ready-to-run fixture for the test/live harness - one representative
# real-usage instance, not a two-code-path engineered fixture and not a
# dormant "_" template.
#
# Exercises scale_units. virtual_hub_id is deliberately absent here - it's
# injected at the harness level (test/live/main.tf) from this harness's own
# test_dependencies.tf, since a real Virtual Hub ID can't be known statically.
#
# Maintained by whoever adds a new optional input to the module: update this
# file in the same PR if you want live coverage of it, same discipline as
# updating tests/express_route_gateway.tftest.hcl.

env               = "livetest"
group             = "caf"
project           = "ergw"
userDefinedString = "livetest"

express_route_gateway = {
  resource_group = "live_test" # key from local.resource_groups (test_dependencies.tf)
  scale_units    = 1
}

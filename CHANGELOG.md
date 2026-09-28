# Changelog

All notable changes to this module will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

## [1.0.0]

### Added

- Initial scaffold of the `terraform-azurerm-caf-express_route_gateway` module wrapping
  `azurerm_express_route_gateway`.
- Support for `scale_units` and `allow_non_virtual_wan_traffic`.
- ESLZ wrapper (`ESLZ/ExpressRouteGateway.tf`) and example tfvars
  (`ESLZ/ExpressRouteGateway.tfvars`).
- Baseline test coverage (`tests/express_route_gateway.tftest.hcl`).
- Live-test CI harness (`test/live/`, `.github/workflows/live-test.yml`) wired to the shared
  OIDC sandbox identity.

terraform {
  required_version = ">= 1.9"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.0"
    }
  }

  # Empty on purpose: the state file path is supplied at `terraform init`
  # time via `-backend-config="path=..."` (partial configuration), so the
  # target-branch checkout and the PR-branch checkout can point at the same
  # external state file without either owning its own local state.
  backend "local" {}
}

provider "azurerm" {
  storage_use_azuread             = true
  resource_provider_registrations = "legacy"
  features {
    resource_group {
      # This harness's resource group is fully self-owned by Terraform - no
      # risk of destroying anything not created by this run.
      prevent_deletion_if_contains_resources = false
    }
  }
}

module "express_route_gateway" {
  # PR code and baseline code are two on-disk checkouts of this same repo,
  # not two resolved git refs - no pinned ?ref, no version toggle here.
  source = "../../"

  env               = var.env
  group             = var.group
  project           = var.project
  userDefinedString = var.userDefinedString
  location          = var.location
  tags              = var.tags
  resource_groups   = local.resource_groups # from test_dependencies.tf

  # virtual_hub_id isn't known until apply time (it comes from this harness's
  # own test_dependencies.tf) - merged in here rather than hardcoded in the
  # tracked tfvars fixture.
  express_route_gateway = merge(var.express_route_gateway, {
    virtual_hub_id = azurerm_virtual_hub.live_test.id
  })
}

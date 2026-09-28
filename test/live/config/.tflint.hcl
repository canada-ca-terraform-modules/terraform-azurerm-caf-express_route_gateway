config {
  call_module_type = "local"
  force            = false
}

# This directory holds only `.tfvars` fixtures, no `.tf` files at all -
# `tflint --recursive --config .tflint.hcl` still walks in here and
# re-resolves the relative config path. Both version rules are meaningless
# with no provider requirements to check.
rule "terraform_required_version" {
  enabled = false
}

rule "terraform_required_providers" {
  enabled = false
}

rule "terraform_module_pinned_source" {
  enabled = true
}

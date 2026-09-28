config {
  call_module_type = "local"
  force            = false
}

# tests/*.tftest.hcl files have no `terraform {}` block of their own - `tflint
# --recursive --config .tflint.hcl` still walks into this directory and
# re-resolves that relative config path here. Both version rules are
# meaningless for a directory with no provider requirements to check.
rule "terraform_required_version" {
  enabled = false
}

rule "terraform_required_providers" {
  enabled = false
}

rule "terraform_module_pinned_source" {
  enabled = true
}

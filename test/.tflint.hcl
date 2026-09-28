config {
  call_module_type = "local"
  force            = false
}

# `tflint --recursive --config .tflint.hcl` re-resolves that relative config
# path inside every subdirectory it walks, including this one - without its
# own copy, CI fails with "Failed to load TFLint config".
rule "terraform_required_version" {
  enabled = false
}

rule "terraform_required_providers" {
  enabled = false
}

rule "terraform_module_pinned_source" {
  enabled = true
}

locals {
  express_route_gateway_regex                             = "/[^0-9a-z]/"
  env-regex_compliant_4                                   = replace(lower(substr(var.env, 0, 4)), local.express_route_gateway_regex, "")
  group-regex_compliant                                   = replace(lower(var.group), local.express_route_gateway_regex, "")
  project-regex_compliant                                 = replace(lower(var.project), local.express_route_gateway_regex, "")
  express_route_gateway-userDefinedString-regex_compliant = replace(lower(var.userDefinedString), local.express_route_gateway_regex, "")
  express_route_gateway_prefix                            = "${local.env-regex_compliant_4}-${local.group-regex_compliant}-${local.project-regex_compliant}"
  express_route_gateway_suffix                            = "-ergw"
  express_route_gateway_name                              = "${substr("${local.express_route_gateway_prefix}-${local.express_route_gateway-userDefinedString-regex_compliant}", 0, 64 - length(local.express_route_gateway_suffix))}${local.express_route_gateway_suffix}"
}

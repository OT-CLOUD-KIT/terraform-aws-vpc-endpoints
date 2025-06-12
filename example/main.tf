module "vpc_endpoints" {
  for_each = var.vpc_endpoints

  source              = "../"
  vpc_id              = var.vpc_id
  service_name        = each.value.service_name
  vpc_endpoint_type   = each.value.vpc_endpoint_type
  subnet_ids          = each.value.subnet_ids
  security_group_ids  = each.value.security_group_ids
  route_table_ids     = each.value.route_table_ids
  auto_accept         = each.value.auto_accept
  private_dns_enabled = each.value.private_dns_enabled
  name                = each.value.name
  tags                = var.common_tags
}

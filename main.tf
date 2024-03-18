resource "aws_vpc_endpoint" "this_endpoint" {
  vpc_id            = var.vpc_id
  service_name      = var.service_name
  vpc_endpoint_type = var.endpoint_type
  route_table_ids   = var.route_table_ids
  policy            = var.endpoint_policy
  tags = merge(
    {
      "Name" = var.endpoint_name
    },
    var.tags,
  )

  auto_accept                                    = var.auto_accept
  private_dns_enabled                            = var.private_dns_enabled
  dns_options                                    = var.dns_options
  ip_address_type                                = var.ip_address_type
  subnet_ids                                     = var.subnet_ids
  security_group_ids                             = var.security_group_ids
  dns_record_ip_type                             = var.dns_record_ip_type
  private_dns_only_for_inbound_resolver_endpoint = var.private_dns_only_for_inbound_resolver_endpoint
}

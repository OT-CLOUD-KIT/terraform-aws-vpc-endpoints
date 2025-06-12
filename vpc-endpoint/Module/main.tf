resource "aws_vpc_endpoint" "this" {
  vpc_id              = var.vpc_id
  service_name        = var.service_name
  vpc_endpoint_type   = var.vpc_endpoint_type
  auto_accept         = var.auto_accept
  private_dns_enabled = var.private_dns_enabled

  # Only for Interface
  subnet_ids         = var.vpc_endpoint_type == "Interface" ? var.subnet_ids : null
  security_group_ids = var.vpc_endpoint_type == "Interface" ? var.security_group_ids : null

  # Only for Gateway
  route_table_ids    = var.vpc_endpoint_type == "Gateway" ? var.route_table_ids : null

  tags = merge(var.tags, {
    Name = var.name
  })
}

#-----------------------------------------------------------------------------------
# Name for security for VPC Interface Endpoints
#-----------------------------------------------------------------------------------
module "name_security_group" {
  for_each = var.vpc_interface_ep_list
  source   = "git@github.com:OT-CLOUD-KIT/terraform-aws-naming.git?ref=dev"
  bu       = var.bu
  env      = var.env
  app      = var.app
  tenant   = var.tenant
  resource = "${each.key}-sg"
}

#-----------------------------------------------------------------------------------
# Security Group for VPC Interface Endpoints
#-----------------------------------------------------------------------------------
module "security_group" {
  for_each = var.vpc_interface_ep_list
  source = "git@github.com:OT-CLOUD-KIT/terraform-aws-security-groups.git?ref=v.0.0.4"
  vpc_id = var.vpc_id
  name   = module.name_security_group[each.key].naming_tag[0]
  tags = merge(
    var.sg_tags,
    var.tags,
    {
      "Name" = module.name_security_group[each.key].naming_tag[0]
    }
  )
  aws_security_group_variables = [
    {
      aws_security_group_ingress = var.sg_ingress_variables
      aws_security_group_egress  = var.sg_egress_variables
    }
  ]
}

#-----------------------------------------------------------------------------------
# Name for VPC Interface Indpoints
#-----------------------------------------------------------------------------------
module "name_interface_ep" {
  for_each = var.vpc_interface_ep_list
  source = "git@github.com:OT-CLOUD-KIT/terraform-aws-naming.git?ref=dev"

  bu       = var.bu
  env      = var.env
  app      = var.app
  tenant   = var.tenant
  resource = "${each.key}-ep"
}

#-----------------------------------------------------------------
# VPC interface endpoint(s)
#-----------------------------------------------------------------
resource "aws_vpc_endpoint" "interface_ep" {
  for_each = var.vpc_interface_ep_list

  vpc_endpoint_type   = "Interface"
  service_name        = var.vpc_interface_ep_list[each.key].service_name
  private_dns_enabled = try(var.vpc_interface_ep_list[each.key].private_dns_enabled, null)
  ip_address_type     = try(var.vpc_interface_ep_list[each.key].ip_address_type, null)
  policy              = can(var.vpc_interface_ep_list[each.key].policy) ? jsonencode(var.vpc_interface_ep_list[each.key].policy) : null
  auto_accept         = try(var.vpc_interface_ep_list[each.key].auto_accept, null)
  vpc_id              = var.vpc_id
  security_group_ids  = module.security_group[each.key].id
  subnet_ids          = var.vpc_interface_ep_subnet_ids

  dynamic "dns_options" {
    for_each = try([var.vpc_interface_ep_list[each.key].dns_options], [])
    content {
      dns_record_ip_type = try(dns_options.value.dns_options.dns_record_ip_type, null)
      private_dns_only_for_inbound_resolver_endpoint = try(dns_options.value.private_dns_only_for_inbound_resolver_endpoint, null)
    }
  }

  tags = merge(
    var.vpc_interface_ep_tags,
    var.tags,
    {
      "Name" = module.name_interface_ep[each.key].naming_tag[0]
    }
  )

  lifecycle {
    ignore_changes = [vpc_id]
  }
}

#-----------------------------------------------------------------------------------
# Name for VPC Gateway Endpoints
#-----------------------------------------------------------------------------------
module "name_gateway_ep" {
  for_each = var.vpc_gateway_ep_list
  source   = "git@github.com:OT-CLOUD-KIT/terraform-aws-naming.git?ref=dev"

  bu       = var.bu
  env      = var.env
  app      = var.app
  tenant   = var.tenant
  resource = "${each.key}-ep"
}

#-----------------------------------------------------------------------------------
# VPC Gateway Endpoint(s)
#-----------------------------------------------------------------------------------
resource "aws_vpc_endpoint" "gateway_ep" {
  for_each = var.vpc_gateway_ep_list

  vpc_endpoint_type = "Gateway"
  service_name      = var.vpc_gateway_ep_list[each.key].service_name
  auto_accept       = try(var.vpc_gateway_ep_list[each.key].auto_accept, null)

  vpc_id          = var.vpc_id
  route_table_ids = var.vpc_gateway_ep_route_table_ids

  tags = merge(
    var.vpc_gateway_ep_tags,
    var.tags,
    {
      "Name" = module.name_gateway_ep[each.key].naming_tag[0]
    }
  )

  lifecycle {
    ignore_changes = [vpc_id]
  }
}

#-----------------------------------------------------------------------------------
# Name for VPC Gateway Loadbalancer Endpoints
#-----------------------------------------------------------------------------------
module "name_gateway_loadbalancer_ep" {
  for_each = var.vpc_gateway_loadbalancer_ep_list
  source   = "git@github.com:OT-CLOUD-KIT/terraform-aws-naming.git?ref=dev"
  bu       = var.bu
  env      = var.env
  app      = var.app
  tenant   = var.tenant
  resource = "${each.key}-ep"
}

#-----------------------------------------------------------------------------------
# Name for VPC Gateway Loadbalancer Endpoint(s)
#-----------------------------------------------------------------------------------
resource "aws_vpc_endpoint" "gateway_loadbalancer_ep" {
   for_each = var.vpc_gateway_loadbalancer_ep_list

   vpc_endpoint_type = "GatewayLoadBalancer"
   service_name     = var.vpc_gateway_loadbalancer_ep_list[each.key].service_name
   auto_accept      = var.vpc_gateway_loadbalancer_ep_list[each.key].auto_accept
   ip_address_type  = var.vpc_gateway_loadbalancer_ep_list[each.key].ip_address_type
   policy           = can(var.vpc_gateway_loadbalancer_ep_list[each.key].policy) ? jsonencode(var.vpc_gateway_loadbalancer_ep_list[each.key].policy) : null

   vpc_id       = var.vpc_id
   subnet_ids   = var.vpc_gateway_loadbalancer_ep_subnet_ids

  tags = merge(
    var.vpc_gateway_ep_tags,
    var.tags,
    {
      "Name" = module.name_gateway_loadbalancer_ep[each.key].naming_tag[0]
    }
  )

   dynamic "subnet_configuration" {
      for_each = try(var.vpc_gateway_loadbalancer_ep_subnet_configuration, [])
      content {
        ipv4         = subnet_configuration.value.ipv4
        ipv6         = subnet_configuration.value.ipv6
        subnet_id = subnet_configuration.value.subnet_id
      }
   }

   lifecycle {
      ignore_changes = [vpc_id]
   }
}

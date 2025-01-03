output "security_group" {
  description = "Security group details"
  value       = {
    "id"    = flatten([for sg in module.security_group : sg.id]),
    "name"  = flatten([for sg in module.security_group : sg.name]),
    "arn"   = flatten([for sg in module.security_group : sg.arn]),
    "type"  = "security-group"
  }
}

output "vpc_endpoint" {
  description = "VPC endpoint details"
  value       = {
    id           = flatten(concat([for ep in aws_vpc_endpoint.interface_ep : ep.id],[for ep in aws_vpc_endpoint.gateway_ep: ep.id], [for ep in aws_vpc_endpoint.gateway_loadbalancer_ep: ep.id]))
    arn          = flatten(concat([for ep in aws_vpc_endpoint.interface_ep : ep.arn],[for ep in aws_vpc_endpoint.gateway_ep : ep.id], [for ep in aws_vpc_endpoint.gateway_loadbalancer_ep : ep.id]))
    name         = flatten(concat([for ep in aws_vpc_endpoint.interface_ep : ep.arn],[for ep in aws_vpc_endpoint.gateway_ep : ep.id], [for ep in aws_vpc_endpoint.gateway_loadbalancer_ep : ep.id]))
    service_name = flatten(concat([for ep in aws_vpc_endpoint.interface_ep : ep.arn],[for ep in aws_vpc_endpoint.gateway_ep: ep.id], [for ep in aws_vpc_endpoint.gateway_loadbalancer_ep : ep.id]))
    type         = "vpc-endpoint"
  }
}

# output "vpc_endpoint_id" {
#   description = "Map of VPC endpoint IDs"
#   value = {
#     for key, ep in module.vpc_interface_endpoint : key => ep.id
#   }
# }

# output "vpc_endpoint_service_name" {
#   description = "Map of VPC endpoint Service names"
#   value = merge(
#     {
#       for key, ep in module.vpc_interface_endpoint : key => ep.service_name
#     },
#     {
#       for key, ep in module.vpc_gateway_endpoint : key => ep.service_name
#     },
#     {
#       for key, ep in module.vpc_gateway_loadbalancer_endpoint : key => ep.service_name
#     }
#   )
# }

# output "vpc_endpoint_service_name" {
#   description = "Map of VPC endpoint service names"
#   value = {
#     for k, v in var.vpc_interface_ep_list : k => {
#       service_name = v.service_name
#     }
#   }
# }



# output "vpc_endpoint_ip_address" {
#   description = "Map of ip address for all VPC endpoints"
#   value = merge(
#     {
#       for key, ep in module.vpc_interface_endpoint : key => ep.vpc_interface_endpoint_ip_address
#     },
#     {
#       for key, ep in module.vpc_gateway_endpoint : key => ep.vpc_gateway_endpoint_ip_address
#     },
#     {
#       for key, ep in module.vpc_gateway_loadbalancer_endpoint : key => ep.vpc_gateway_loadbalancer_endpoint_ip_address
#     }
#   )
# }

# output "vpc_id" {
#   description = "The VPC ID where interface endpoints are created"
#   value = var.vpc_id
# }

output "vpc_endpoint_ids" {
  description = "Map of VPC Endpoint IDs for all defined services"
  value = {
    for k, mod in module.vpc_endpoints : k => mod.vpc_endpoint_id
  }
}

output "vpc_endpoint_types" {
  description = "Map of VPC Endpoint Types (Interface or Gateway)"
  value = {
    for k, mod in module.vpc_endpoints : k => mod.vpc_endpoint_type
  }
}

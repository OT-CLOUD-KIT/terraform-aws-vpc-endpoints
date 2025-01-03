output "sg" {
  value = module.example_ep.security_group
}

output "interface_ep" {
  value = module.example_ep.vpc_endpoint
}

module "standard_tags" {
  source = "git@github.com:OT-CLOUD-KIT/terraform-aws-standard-tagging.git?ref=dev"
  env     = var.env
  app     = var.app
  bu      = var.bu
  program = "edcil"
  team    = "lspl"
  region  = "ap-south-1"
}

module "example_ep" {
  source = "../"

  env     = var.env
  app     = var.app
  bu      = var.bu
  vpc_id  = var.vpc_id
  tags    = module.standard_tags.standard_tags

  # VPC Interface Endpoints
  vpc_interface_ep_list       = var.vpc_interface_ep_list
  vpc_interface_ep_subnet_ids = var.vpc_interface_ep_subnet_ids

  # VPC Interface Endpoints

  vpc_gateway_ep_list            = var.vpc_gateway_ep_list
  vpc_gateway_ep_route_table_ids = var.vpc_gateway_ep_route_table_ids
}

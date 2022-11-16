provider "aws" {
  region = var.region
}

module "s3_endpoints" {
    source = "./ENDPOINT"
    vpc_id = var.vpc_id
    service_name = var.s3_service_name
    endpoint_type = var.s3_endpoint_type
    route_table_ids = var.route_table_ids
    endpoint_policy = var.endpoint_policy
    endpoint_name = var.s3_endpoint_name
}

module "nlb_endpoints" {
    source = "./ENDPOINT"
    vpc_id = var.vpc_id
    service_name = var.nlb_service_name
    endpoint_type = var.nlb_endpoint_type
    route_table_ids = var.route_table_ids
    endpoint_policy = var.endpoint_policy
    endpoint_name = var.nlb_endpoint_name
}

module "rds_endpoints" {
    source = "./ENDPOINT"
    vpc_id = var.vpc_id
    service_name = var.rds_service_name
    endpoint_type = var.rds_endpoint_type
    route_table_ids = var.route_table_ids
    endpoint_policy = var.endpoint_policy
    endpoint_name = var.rds_endpoint_name
}
 

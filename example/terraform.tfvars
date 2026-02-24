vpc_id = "vpc-0bfa15004ff55e107"

common_tags = {
  Environment = "dev"
  Project     = "ot-cloud"
  Owner       = "nikita"
}

vpc_endpoints = {
  s3_endpoint = {
    service_name        = "com.amazonaws.us-east-1.s3"
    vpc_endpoint_type   = "Gateway"
    subnet_ids          = ["subnet-08a2aa30dbc179a2b"]
    security_group_ids  = ["sg-04fb2f273d8865af3"]
    route_table_ids     = ["rtb-0f05d6fd762bf3a45"]
    auto_accept         = true
    private_dns_enabled = false
    name                = "s3-endpoint"
  }

  
}

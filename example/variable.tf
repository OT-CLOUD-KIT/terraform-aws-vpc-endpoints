variable "vpc_id" {
  type = string
}

variable "common_tags" {
  type        = map(string)
  default     = {}
  description = "Tags applied to all endpoints"
}

variable "vpc_endpoints" {
  type = map(object({
    service_name        = string
    vpc_endpoint_type   = string
    subnet_ids          = list(string)
    security_group_ids  = list(string)
    route_table_ids     = list(string)
    auto_accept         = bool
    private_dns_enabled = bool
    name                = string
  }))
}

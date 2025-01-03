# ------------------------------------------------------------
# naming conventions variables
# ------------------------------------------------------------
variable "env" {
  description = "name of the environment"
  type        = string
}

variable "bu" {
  description = "name of the business unit"
  type        = string
}

variable "app" {
  description = "Name of the application, For ex: network, shared, ot etc."
  type        = string
}

variable "tenant" {
  description = "Name of the tenant"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
}

variable "vpc_interface_ep_list" {
  description = "Map of all VPC interface endpoints"
  type = map(object({
    service_name        = optional(string, null)
    private_dns_enabled = optional(bool, true)
    ip_address_type     = optional(string, "ipv4")
    auto_accept         = optional(bool, true)
    policy = optional(any, {
      Statement = [
        {
          Action    = "*"
          Effect    = "Allow"
          Principal = "*"
          Resource  = "*"
        }
      ]
    })
  }))
  default = {}
}

variable "vpc_interface_ep_subnet_ids" {
  description = "Subnet ids for all VPC interface endpoints"
  type        = list(string)
  default     = []
}

variable "vpc_gateway_ep_list" {
  description = "Map of all VPC gateway endpoints"
  type = map(object({
    service_name = optional(string, null)
    auto_accept  = optional(bool, true)
    policy = optional(any, {
      Statement = [
        {
          Action    = "*"
          Effect    = "Allow"
          Principal = "*"
          Resource  = "*"
        }
      ]
    })
  }))
  default = {}
}

variable "vpc_gateway_ep_route_table_ids" {
  description = "Route table ids for all VPC gateway endpoints"
  type        = list(string)
  default     = []
}

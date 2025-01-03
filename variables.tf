#-----------------------------------------------------------------------------------
# Common variables
#-----------------------------------------------------------------------------------
variable "vpc_id" {
  description = "VPC ID for the composite module"
  type        = string
}

variable "tags" {
  description = "Tags for the security group"
  type        = map(string)
  default     = {}
}

#-----------------------------------------------------------------------------------
# Naming and Tag variables
#-----------------------------------------------------------------------------------
variable "bu" {
  description = "Name of the business unit, For ex: bu which are supported by DDP are: pcs, ultrasound etc."
  type        = string
}

variable "env" {
  description = "Name of the environment example: for development env it should be 'd', prod env should be 'p', testing env should be 'q' and staging env should be's'."
  type        = string
}

variable "app" {
  description = "Name of the application, For ex: network, shared, ddp etc."
  type        = string
}

variable "tenant" {
  description = "Name of the tenant"
  type        = string
  default = ""
}

#-----------------------------------------------------------------------------------
# Security group variables
#-----------------------------------------------------------------------------------
variable "sg_tags" {
  description = "Tags for the security group"
  type        = map(string)
  default     = {}
}

variable "sg_ingress_variables" {
  description = "List of ingress rules for the security group"
  type = list(object({
    cidr_blocks = optional(list(string))
    description = optional(string)
    from_port   = number
    to_port     = number
    protocol    = string
  }))
  default = [
    {
      cidr_blocks = []
      description = null
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
    }
  ]
}

variable "sg_egress_variables" {
  description = "List of egress rules for the security group"
  type = list(object({
    cidr_blocks = optional(list(string))
    description = optional(string)
    from_port   = number
    to_port     = number
    protocol    = string
  }))
  default = [
    {
      cidr_blocks = []
      description = null
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
    }
  ]
}

#-----------------------------------------------------------------------------------
# VPC interface endpoint variables
#-----------------------------------------------------------------------------------
variable "vpc_interface_ep_tags" {
  description = "Tags for all VPC interface endpoints"
  type        = map(string)
  default     = {}
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

#-----------------------------------------------------------------------------------
# VPC gateway endpoint variables
#-----------------------------------------------------------------------------------
variable "vpc_gateway_ep_tags" {
  description = "Tags for all VPC gateway endpoints"
  type        = map(string)
  default     = {}
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

#-----------------------------------------------------------------------------------
# VPC gateway loadbalancer endpoint variables
#-----------------------------------------------------------------------------------
variable "vpc_gateway_loadbalancer_ep_tags" {
  description = "Tags for all VPC gateway loadbalancer endpoints"
  type        = map(string)
  default     = {}
}

variable "vpc_gateway_loadbalancer_ep_list" {
  description = "Map of all VPC gateway loadbalancer endpoints"
  type = map(object({
    service_name    = optional(string, null)
    ip_address_type = optional(string, null)
    auto_accept     = optional(bool, true)
  }))
  default = {}
}

variable "vpc_gateway_loadbalancer_ep_subnet_ids" {
  description = "Subnet ids for all VPC gateway loadbalancer endpoints"
  type        = list(string)
  default     = []
}

variable "vpc_gateway_loadbalancer_ep_subnet_configuration" {
  description = "Subnet configuration for all VPC gateway loadbalancer endpoints"
  type        = list(any)
  default     = []
}


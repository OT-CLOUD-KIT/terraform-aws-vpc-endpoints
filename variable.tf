variable "vpc_id" {
  type = string
}

variable "service_name" {
  type = string
}

variable "vpc_endpoint_type" {
  type = string
}

variable "subnet_ids" {
  type    = list(string)
  default = []
}

variable "security_group_ids" {
  type    = list(string)
  default = []
}

variable "route_table_ids" {
  type    = list(string)
  default = []
}

variable "auto_accept" {
  type    = bool
  default = false
}

variable "private_dns_enabled" {
  type    = bool
  default = false
}

variable "name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

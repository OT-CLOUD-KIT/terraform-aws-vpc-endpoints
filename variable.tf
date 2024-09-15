variable "vpc_id" {
  type        = string
  description = "vpc id"
}

variable "service_name" {
  type        = string
  description = "service name"
}

variable "endpoint_type" {
  type        = string
  default     = "Gateway"
  description = "endpoint type"
}

variable "route_table_ids" {
  type        = list(any)
  description = "route table id for endpoint"
}

variable "endpoint_policy" {
  type        = string
  description = "policy for endpoint"
  default     = <<EOF
  {
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Principal": "*",
			"Action": "*",
			"Resource": "*"
		}
	]
}
EOF
}

variable "endpoint_name" {
  type        = string
  description = "endpoint name"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "auto_accept" {
  type        = bool
  default     = false
  description = "Whether or not to automatically accept endpoint connections"
}

variable "private_dns_enabled" {
  type        = bool
  default     = true
  description = "Whether or not to enable private DNS for the endpoint"
}

variable "dns_options" {
  type        = map(string)
  default     = {}
  description = "DNS options for the endpoint"
}

variable "ip_address_type" {
  type        = string
  default     = "ipv4"
  description = "The IP address type to use for the endpoint"
}

variable "subnet_ids" {
  type        = list(string)
  default     = []
  description = "List of subnet IDs in which to create the endpoint network interfaces"
}

variable "security_group_ids" {
  type        = list(string)
  default     = []
  description = "List of security group IDs to associate with the endpoint network interfaces"
}

variable "dns_record_ip_type" {
  type        = string
  default     = "A"
  description = "The IP type for the DNS record"
}

variable "private_dns_only_for_inbound_resolver_endpoint" {
  type        = bool
  default     = false
  description = "Whether or not to enable private DNS only for inbound resolver endpoint"
}

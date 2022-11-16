
variable "vpc_id" {
  type        = string
  default     = ""
  description = "vpc id"
}

####################### endpoint ###################

variable "service_name" {
  type        = string
  description = "service name"
}

variable "endpoint_type" {
  type        = string
  default     = "Gateway"
  description = " endpoint type"
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


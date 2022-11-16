variable "region" {
  type        = string
  default     = "us-west-2"
  description = "region"
}


variable "vpc_id" {
  type        = string
  default     = ""
  description = "vpc id"
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

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

####################### S3Endpoint ###################

variable "s3_service_name" {
  type        = string
  description = "service name"
}

variable "s3_endpoint_type" {
  type        = string
  default     = "Gateway"
  description = " endpoint type"
}

variable "s3_endpoint_name" {
  type        = string
  description = "endpoint name"
}

####################### NlbEndpoint ###################

variable "nlb_service_name" {
  type        = string
  description = "service name"
}

variable "nlb_endpoint_type" {
  type        = string
  default     = "Gateway"
  description = " endpoint type"
}

variable "nlb_endpoint_name" {
  type        = string
  description = "endpoint name"
}

####################### RdsEndpoint ###################

variable "rds_service_name" {
  type        = string
  description = "service name"
}

variable "rds_endpoint_type" {
  type        = string
  default     = "Gateway"
  description = " endpoint type"
}

variable "rds_endpoint_name" {
  type        = string
  description = "endpoint name"
}
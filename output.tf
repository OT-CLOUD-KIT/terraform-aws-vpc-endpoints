output "vpc_endpoint_id" {
  value = aws_vpc_endpoint.this.id
}

output "vpc_endpoint_type" {
  value = aws_vpc_endpoint.this.vpc_endpoint_type
}

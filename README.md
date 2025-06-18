
## Terraform AWS VPC Endpoint

This Terraform module simplifies the creation and management of VPC Endpoints, supporting both Interface and Gateway types. It allows you to securely connect your VPC to supported AWS services without requiring an internet gateway, NAT device, or VPN connection.

## Prerequisites
Before using this module, ensure that the following resources are already provisioned:

- A VPC

- At least one Subnet (required for Interface endpoints)

- One or more Route Tables (required for Gateway endpoints)
  
## Architecture

![new_endpoint](https://github.com/user-attachments/assets/44be96a6-f21f-4fc6-9f5d-481a6a0e7099)<?xml version="1.0" encoding="UTF-8"?>


## Providers

| Name                                              | Version  |
|---------------------------------------------------|----------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.82.2   |
| <a name="terraform_module"></a> [Terraform](Terraform\module) | >= 1.12.1|


# Usage

```hcl

module "vpc_endpoints" {
  for_each = var.vpc_endpoints

  source              = "../"
  vpc_id              = var.vpc_id
  service_name        = each.value.service_name
  vpc_endpoint_type   = each.value.vpc_endpoint_type
  subnet_ids          = each.value.subnet_ids
  security_group_ids  = each.value.security_group_ids
  route_table_ids     = each.value.route_table_ids
  auto_accept         = each.value.auto_accept
  private_dns_enabled = each.value.private_dns_enabled
  name                = each.value.name
  tags                = var.common_tags
}

```

> **Note:**  
> The above example demonstrates how to use the module. All variables, resources, and outputs used here are already defined within this module.

> **Related Module:**  
> If you're looking for a production-ready VPC setup with best practices (CIDR structure, subnets, route tables, flow logs, tagging, etc.), check out our  
> [Terraform AWS Network Skeleton](https://github.com/OT-CLOUD-KIT/terraform-aws-network-skeleton)

---
## Resources

| Name | Type |
|------|------|
| [aws_vpc_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vpc_id"></a> [`vpc_id`](#input_vpc_id) | The ID of the VPC in which to create the endpoint(s) | `string` | n/a | yes|
| <a name="input_common_tags"></a> [`common_tags`](#input_common_tags) | Common tags applied to all resources | `map(string)` | `{}` | No |
| <a name="input_vpc_endpoints"></a> [`vpc_endpoints`](#input_vpc_endpoints) | Map of endpoint definitions with full configuration per endpoint | `map(object)` | `{}` | yes |
| <a name="attr_service_name"></a> [`service_name`](#attr_service_name) | AWS service name (e.g., `com.amazonaws.us-east-1.s3`) | `string` | yes|yes|
| <a name="attr_vpc_endpoint_type"></a> [`vpc_endpoint_type`](#attr_vpc_endpoint_type) | Type of endpoint (`Interface` or `Gateway`) | `string` | yes|yes|
| <a name="attr_subnet_ids"></a> [`subnet_ids`](#attr_subnet_ids) | Subnet IDs (used for Interface endpoints) | `list(string)` | No |yes|
| <a name="attr_security_group_ids"></a> [`security_group_ids`](#attr_security_group_ids) | Security Group IDs (used for Interface endpoints) | `list(string)` | No |yes|
| <a name="attr_route_table_ids"></a> [`route_table_ids`](#attr_route_table_ids) | Route Table IDs (used for Gateway endpoints) | `list(string)` | No |yes|
| <a name="attr_auto_accept"></a> [`auto_accept`](#attr_auto_accept) | Whether the endpoint connection should be auto-accepted | `bool` | No|yes|
| <a name="attr_private_dns_enabled"></a> [`private_dns_enabled`](#attr_private_dns_enabled) | Enable private DNS for the service (Interface only) | `bool` | No |No|

---

## Outputs

| Name | Description |
|------|-------------|
| <a name="vpc_endpoint_ids"></a> [`vpc_endpoint_ids`](#vpc_endpoint_ids) | Map of VPC Endpoint IDs for all defined services |
| <a name="vpc_endpoint_types"></a> [`vpc_endpoint_types`](#vpc_endpoint_types) | Map of VPC Endpoint Types (`Interface` or `Gateway`) |



## Considerations
- Ensure VPC, Subnets, and Route Tables are created beforehand.
- Use appropriate naming conventions to match organizational standards.

---

## Contributors

- [Piyush Upadhyay](https://github.com/piiiyuushh)
- [Nikita Joshi](https://github.com/jnikita19)


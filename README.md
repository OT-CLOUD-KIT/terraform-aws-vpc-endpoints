
# Terraform module to create VPC Endpoints

This module creates VPC endpoints (both interface and gateway types).

## Architecture
![image](https://github.com/user-attachments/assets/4ade5f65-acaa-409e-9495-343e935222f1)



## Providers
| Name | Version |
|------|---------|
| aws  | >= 5.30 |


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


## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vpc_interface_ep_list | List of interface endpoints | list(object) | [] | no |
| vpc_interface_ep_subnet_ids | Subnet IDs for interface EPs | list(string) | [] | no |
| vpc_interface_ep_tags | Tags for interface EPs | map(string) | {} | no |
| vpc_gateway_ep_list | List of gateway endpoints | list(object) | [] | no |
| vpc_gateway_ep_route_table_ids | Route Table IDs | list(string) | [] | no |
| vpc_gateway_ep_tags | Tags for gateway EPs | map(string) | {} | no |

## Outputs
| Name | Description |
|------|-------------|
| vpc_endpoint | VPC endpoint details |
| vpc_endpoint_id | Map of VPC endpoint IDs |
| vpc_endpoint_service_name | Map of VPC endpoint service names |
| vpc_gateway_ep_arns | ARNs of gateway endpoints |
| vpc_gateway_ep_ids | IDs of gateway endpoints |
| vpc_interface_ep_arns | ARNs of interface endpoints |
| vpc_interface_ep_ids | IDs of interface endpoints |

## Considerations
- Ensure VPC, Subnets, and Route Tables are created beforehand.
- Use appropriate naming conventions to match organizational standards.

<!-- END_TF_DOCS -->

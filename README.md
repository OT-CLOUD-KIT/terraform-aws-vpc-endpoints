
# Terraform module to create VPC Endpoints

This module creates VPC endpoints (both interface and gateway types).

## Architecture
![image](https://github.com/user-attachments/assets/4ade5f65-acaa-409e-9495-343e935222f1)



## Providers
| Name | Version |
|------|---------|
| aws  | >= 5.30 |

## Modules
| Name | Source | Version |
|------|--------|---------|
| name_gateway_ep | google.com/naming-tag.git | feature/US106973 |
| name_interface_ep | google.com/naming-tag.git | feature/US106973 |
| vpc_gateway_endpoint | google.com/aws-gateway-vpc-endpoint.git | tag-name-change |
| vpc_interface_endpoint | google.com/aws-interface-vpc-endpoint.git | tag-name-change |

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

# Composite terraform module to create VPC endpoints and security groups
Terraform module to create VPC endpoints and security groups.

## Goal
This terraform module creates VPC endpoints (interface and gateway type endpoints) and security groups usinf the following terraform modules.
1. [AWS interface VPC endpoint](https://gitlab.apps.ge-healthcare.net/pcs-digital-operations/sre/temp-workspace/terraform-modules/aws-interface-vpc-endpoint)
2. [AWS gateway VPC endpoint](https://gitlab.apps.ge-healthcare.net/pcs-digital-operations/sre/temp-workspace/terraform-modules/aws-gateway-vpc-endpoint)
3. [AWS security group](https://gitlab.apps.ge-healthcare.net/pcs-digital-operations/sre/temp-workspace/terraform-modules/aws-security-group)

## Dependencies
Please make sure that the following AWS resources are created before executing this module.
- VPC
- Subnet

## Considerations
### 1. Naming conventions
The naming conventions mentioned in this [design document](https://gehealthcare.ent.box.com/file/1600220869927?s=q4oeoc42nhq7uwami3w0x616rn7hb9ea) are followed in this composite module.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.30 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_name_gateway_ep"></a> [name\_gateway\_ep](#module\_name\_gateway\_ep) | git@gitlab.apps.ge-healthcare.net:pcs-digital-operations/sre/temp-workspace/terraform-modules/naming-tag.git | feature/US106973 |
| <a name="module_name_interface_ep"></a> [name\_interface\_ep](#module\_name\_interface\_ep) | git@gitlab.apps.ge-healthcare.net:pcs-digital-operations/sre/temp-workspace/terraform-modules/naming-tag.git | feature/US106973 |
| <a name="module_name_security_group"></a> [name\_security\_group](#module\_name\_security\_group) | git@gitlab.apps.ge-healthcare.net:pcs-digital-operations/sre/temp-workspace/terraform-modules/naming-tag.git | feature/US106973 |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | git@gitlab.apps.ge-healthcare.net:pcs-digital-operations/sre/temp-workspace/terraform-modules/aws-security-group.git | tag-name-change |
| <a name="module_vpc_gateway_endpoint"></a> [vpc\_gateway\_endpoint](#module\_vpc\_gateway\_endpoint) | git@gitlab.apps.ge-healthcare.net:pcs-digital-operations/sre/temp-workspace/terraform-modules/aws-gateway-vpc-endpoint.git | tag-name-change |
| <a name="module_vpc_interface_endpoint"></a> [vpc\_interface\_endpoint](#module\_vpc\_interface\_endpoint) | git@gitlab.apps.ge-healthcare.net:pcs-digital-operations/sre/temp-workspace/terraform-modules/aws-interface-vpc-endpoint.git | tag-name-change |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | Name of the application, For ex: network, shared, ddp etc. | `string` | n/a | yes |
| <a name="input_bu"></a> [bu](#input\_bu) | Name of the business unit, For ex: bu which are supported by DDP are: pcs, ultrasound etc. | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Name of the environment example: for development env it should be 'd', prod env should be 'p', testing env should be 'q' and staging env should be's'. | `string` | n/a | yes |
| <a name="input_sg_egress_variables"></a> [sg\_egress\_variables](#input\_sg\_egress\_variables) | List of egress rules for the security group | <pre>list(object({<br>  cidr_blocks = optional(list(string))<br>    description = optional(string)<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>  }))</pre> | <pre>[<br>  {<br>    "cidr_blocks": [],<br>    "description": null,<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "to_port": 0<br>  }<br>]</pre> | no |     
| <a name="input_sg_ingress_variables"></a> [sg\_ingress\_variables](#input\_sg\_ingress\_variables) | List of ingress rules for the security group | <pre>list(object({<br>    cidr_blocks = optional(list(string))<br>    description = optional(string)<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>  }))</pre> | <pre>[<br>  {<br>    "cidr_blocks": [],<br>    "description": null,<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "to_port": 0<br>  }<br>]</pre> | no | 
| <a name="input_sg_tags"></a> [sg\_tags](#input\_sg\_tags) | Tags for the security group | `map(string)` | `{}` | no |
| <a name="input_vpc_gateway_ep_list"></a> [vpc\_gateway\_ep\_list](#input\_vpc\_gateway\_ep\_list) | A list of all VPC gateway endpoints | <pre>list(object({<br>    service_name = optional(string, null)<br>    auto_accept  = optional(bool, true)<br>    policy = optional(any, {<br>      Statement = [<br>        {<br>          Action    = "*"<br>          Effect    = "Allow"<br>          Principal = "*"<br>          Resource  = "*"<br>        }<br>      ]<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_vpc_gateway_ep_route_table_ids"></a> [vpc\_gateway\_ep\_route\_table\_ids](#input\_vpc\_gateway\_ep\_route\_table\_ids) | Route table ids for all VPC gateway endpoints | `list(string)` | `[]` | no |
| <a name="input_vpc_gateway_ep_tags"></a> [vpc\_gateway\_ep\_tags](#input\_vpc\_gateway\_ep\_tags) | Tags for all VPC gateway endpoints | `map(string)` | `{}` | no |     
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID for the composite module | `string` | n/a | yes |
| <a name="input_vpc_interface_ep_list"></a> [vpc\_interface\_ep\_list](#input\_vpc\_interface\_ep\_list) | A list of all VPC interface endpoints | <pre>list(object({<br>    service_name        = optional(string, null)<br>    private_dns_enabled = optional(bool, true)<br>    ip_address_type     = optional(string, "ipv4")<br>    auto_accept        = optional(bool, true)<br>    policy = optional(any, {<br>      Statement = [<br>        {<br>          Action    = "*"<br>          Effect    = "Allow"<br>          Principal = "*"<br>          Resource  = "*"<br>        }<br>      ]<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_vpc_interface_ep_subnet_ids"></a> [vpc\_interface\_ep\_subnet\_ids](#input\_vpc\_interface\_ep\_subnet\_ids) | Subnet ids for all VPC interface endpoints | `list(string)` | `[]` | no |
| <a name="input_vpc_interface_ep_tags"></a> [vpc\_interface\_ep\_tags](#input\_vpc\_interface\_ep\_tags) | Tags for all VPC interface endpoints | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_gateway_ep_arns"></a> [vpc\_gateway\_ep\_arns](#output\_vpc\_gateway\_ep\_arns) | ARNs of the VPC gateway endpoints |
| <a name="output_vpc_gateway_ep_ids"></a> [vpc\_gateway\_ep\_ids](#output\_vpc\_gateway\_ep\_ids) | IDs of the VPC gateway endpoints |
| <a name="output_vpc_interface_ep_arns"></a> [vpc\_interface\_ep\_arns](#output\_vpc\_interface\_ep\_arns) | ARNs of the VPC interface endpoints |
| <a name="output_vpc_interface_ep_ids"></a> [vpc\_interface\_ep\_ids](#output\_vpc\_interface\_ep\_ids) | IDs of the VPC interface endpoints |

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.30 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_name_gateway_ep"></a> [name\_gateway\_ep](#module\_name\_gateway\_ep) | naming-tag | n/a |
| <a name="module_name_gateway_loadbalancer_ep"></a> [name\_gateway\_loadbalancer\_ep](#module\_name\_gateway\_loadbalancer\_ep) | naming-tag | n/a |
| <a name="module_name_interface_ep"></a> [name\_interface\_ep](#module\_name\_interface\_ep) | naming-tag | n/a |
| <a name="module_name_security_group"></a> [name\_security\_group](#module\_name\_security\_group) | naming-tag | n/a |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | aws-security-group | n/a |
| <a name="module_vpc_gateway_endpoint"></a> [vpc\_gateway\_endpoint](#module\_vpc\_gateway\_endpoint) | aws-gateway-vpc-endpoint | n/a |
| <a name="module_vpc_gateway_loadbalancer_endpoint"></a> [vpc\_gateway\_loadbalancer\_endpoint](#module\_vpc\_gateway\_loadbalancer\_endpoint) | aws-gateway-loadbalancer-vpc-endpoint | n/a |
| <a name="module_vpc_interface_endpoint"></a> [vpc\_interface\_endpoint](#module\_vpc\_interface\_endpoint) | aws-interface-vpc-endpoint | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | Name of the application, For ex: network, shared, ddp etc. | `string` | n/a | yes |
| <a name="input_bu"></a> [bu](#input\_bu) | Name of the business unit, For ex: bu which are supported by DDP are: pcs, ultrasound etc. | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Name of the environment example: for development env it should be 'd', prod env should be 'p', testing env should be 'q' and staging env should be's'. | `string` | n/a | yes |
| <a name="input_sg_egress_variables"></a> [sg\_egress\_variables](#input\_sg\_egress\_variables) | List of egress rules for the security group | <pre>list(object({<br>    cidr_blocks = optional(list(string))<br>    description = optional(string)<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>  }))</pre> | <pre>[<br>  {<br>    "cidr_blocks": [],<br>    "description": null,<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_sg_ingress_variables"></a> [sg\_ingress\_variables](#input\_sg\_ingress\_variables) | List of ingress rules for the security group | <pre>list(object({<br>    cidr_blocks = optional(list(string))<br>    description = optional(string)<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>  }))</pre> | <pre>[<br>  {<br>    "cidr_blocks": [],<br>    "description": null,<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_sg_tags"></a> [sg\_tags](#input\_sg\_tags) | Tags for the security group | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for the security group | `map(string)` | `{}` | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | Name of the tenant | `string` | `""` | no |
| <a name="input_vpc_gateway_ep_list"></a> [vpc\_gateway\_ep\_list](#input\_vpc\_gateway\_ep\_list) | Map of all VPC gateway endpoints | <pre>map(object({<br>    service_name = optional(string, null)<br>    auto_accept  = optional(bool, true)<br>    policy = optional(any, {<br>      Statement = [<br>        {<br>          Action    = "*"<br>          Effect    = "Allow"<br>          Principal = "*"<br>          Resource  = "*"<br>        }<br>      ]<br>    })<br>  }))</pre> | `{}` | no |
| <a name="input_vpc_gateway_ep_route_table_ids"></a> [vpc\_gateway\_ep\_route\_table\_ids](#input\_vpc\_gateway\_ep\_route\_table\_ids) | Route table ids for all VPC gateway endpoints | `list(string)` | `[]` | no |
| <a name="input_vpc_gateway_ep_tags"></a> [vpc\_gateway\_ep\_tags](#input\_vpc\_gateway\_ep\_tags) | Tags for all VPC gateway endpoints | `map(string)` | `{}` | no |
| <a name="input_vpc_gateway_loadbalancer_ep_list"></a> [vpc\_gateway\_loadbalancer\_ep\_list](#input\_vpc\_gateway\_loadbalancer\_ep\_list) | Map of all VPC gateway loadbalancer endpoints | <pre>map(object({<br>    service_name = optional(string, null)<br>    ip_address_type = optional(string, null)<br>    auto_accept  = optional(bool, true)<br>  }))</pre> | `{}` | no |
| <a name="input_vpc_gateway_loadbalancer_ep_subnet_configuration"></a> [vpc\_gateway\_loadbalancer\_ep\_subnet\_configuration](#input\_vpc\_gateway\_loadbalancer\_ep\_subnet\_configuration) | Subnet configuration for all VPC gateway loadbalancer endpoints | `list(any)` | `[]` | no |
| <a name="input_vpc_gateway_loadbalancer_ep_subnet_ids"></a> [vpc\_gateway\_loadbalancer\_ep\_subnet\_ids](#input\_vpc\_gateway\_loadbalancer\_ep\_subnet\_ids) | Subnet ids for all VPC gateway loadbalancer endpoints | `list(string)` | `[]` | no |
| <a name="input_vpc_gateway_loadbalancer_ep_tags"></a> [vpc\_gateway\_loadbalancer\_ep\_tags](#input\_vpc\_gateway\_loadbalancer\_ep\_tags) | Tags for all VPC gateway loadbalancer endpoints | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID for the composite module | `string` | n/a | yes |
| <a name="input_vpc_interface_ep_list"></a> [vpc\_interface\_ep\_list](#input\_vpc\_interface\_ep\_list) | Map of all VPC interface endpoints | <pre>map(object({<br>    service_name        = optional(string, null)<br>    private_dns_enabled = optional(bool, true)<br>    ip_address_type     = optional(string, "ipv4")<br>    auto_accept         = optional(bool, true)<br>    policy = optional(any, {<br>      Statement = [<br>        {<br>          Action    = "*"<br>          Effect    = "Allow"<br>          Principal = "*"<br>          Resource  = "*"<br>        }<br>      ]<br>    })<br>  }))</pre> | `{}` | no |
| <a name="input_vpc_interface_ep_subnet_ids"></a> [vpc\_interface\_ep\_subnet\_ids](#input\_vpc\_interface\_ep\_subnet\_ids) | Subnet ids for all VPC interface endpoints | `list(string)` | `[]` | no |
| <a name="input_vpc_interface_ep_tags"></a> [vpc\_interface\_ep\_tags](#input\_vpc\_interface\_ep\_tags) | Tags for all VPC interface endpoints | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_group"></a> [security\_group](#output\_security\_group) | Security group details |
| <a name="output_vpc_endpoint"></a> [vpc\_endpoint](#output\_vpc\_endpoint) | VPC endpoint details |
| <a name="output_vpc_endpoint_id"></a> [vpc\_endpoint\_id](#output\_vpc\_endpoint\_id) | Map of VPC endpoint IDs |
| <a name="output_vpc_endpoint_service_name"></a> [vpc\_endpoint\_service\_name](#output\_vpc\_endpoint\_service\_name) | Map of VPC endpoint Service names |
<!-- END_TF_DOCS -->
# terraform-aws-vpc-enpoints


# Example to use module

provider "aws" {
  region = "us-west-2"  # or specify your desired region
}

module "my_vpc_endpoint" {
  source = "./terraform-aws-vpc-enpoints/"  # Path to your module directory or module registry
  
  # Pass values to the input variables
  vpc_id                                           = "your_vpc_id"
  service_name                                     = "your_service_name"
  endpoint_name                                    = "your_endpoint_name"
  route_table_ids                                  = ["rtb-12345678"]  # Example route table ID
  tags                                             = {
    "Environment" = "Production"
    "Owner"       = "YourName"
  }

  # You can provide values to other optional variables as needed
  auto_accept                                      = false
  private_dns_enabled                              = true
  dns_options                                      = {}
  ip_address_type                                  = "ipv4"
  subnet_ids                                       = ["subnet-12345678"]  # Example subnet ID
  security_group_ids                               = ["sg-12345678"]  # Example security group ID
  dns_record_ip_type                               = "A"
  private_dns_only_for_inbound_resolver_endpoint  = false
}

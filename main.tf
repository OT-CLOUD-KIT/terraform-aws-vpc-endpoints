resource "aws_vpc_endpoint" "this_endpoint" {
    vpc_id = var.vpc_id
    service_name = var.service_name
    vpc_endpoint_type = var.endpoint_type
    route_table_ids = var.route_table_ids
    policy = var.endpoint_policy
    tags = merge(
    {
        "Name" = var.endpoint_name
    },
    var.tags,
)

}
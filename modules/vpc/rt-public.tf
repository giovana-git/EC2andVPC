resource "aws_internet_gateway" "igw" {
    
    vpc_id = aws_vpc.vpc-terraform.id

    tags = {
      Name = var.name
    }
}

# resource "aws_internet_gateway_attachment" "att-igw" {

#     depends_on = [
#       aws_internet_gateway.igw
#     ]

#     vpc_id = aws_vpc.vpc-terraform.id
#     internet_gateway_id = aws_internet_gateway.igw.id
# }

resource "aws_default_route_table" "public" {

    depends_on = [
      aws_internet_gateway.igw
    ]

    default_route_table_id = aws_vpc.vpc-terraform.default_route_table_id
    
    route {
      cidr_block = var.default_route_tables[0]
      gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
      Name = "public-route-tf"
    }
}

resource "aws_route_table_association" "ass-route-public" {
    
  depends_on = [
    aws_default_route_table.public
  ]

    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_default_route_table.public.id
}

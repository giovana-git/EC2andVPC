resource "aws_eip" "elastic-ip" {
    vpc = true
}

resource "aws_nat_gateway" "nat-gw" {
    
    depends_on = [
      aws_internet_gateway.igw
    ]

    allocation_id = aws_eip.elastic-ip.id
    subnet_id = aws_subnet.private_subnet.id

    tags = {
      Name = "nat-tf"
    }
}


resource "aws_route_table" "private-rt-table" {

    vpc_id = aws_vpc.vpc-terraform.id

    tags = {
      Name = "private-route-table"
    }
}

resource "aws_route" "private-route" {

    depends_on = [
      aws_nat_gateway.nat-gw
    ]

    route_table_id = aws_route_table.private-rt-table.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id  
}

resource "aws_route_table_association" "ass-route-private" {

    depends_on = [
      aws_subnet.private_subnet,
      aws_route_table.private-rt-table
    ]

    subnet_id = aws_subnet.private_subnet.id
    route_table_id = aws_route_table.private-rt-table.id
}

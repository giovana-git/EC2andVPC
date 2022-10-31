resource "aws_subnet" "private_subnet" {

    vpc_id = aws_vpc.vpc-terraform.id
    cidr_block = var.private_subnets
    availability_zone = var.azs[0]
    map_public_ip_on_launch = true

    tags = {
        Name = "private-subnet-2a"
    }
}

resource "aws_subnet" "public_subnet" {

    vpc_id = aws_vpc.vpc-terraform.id
    cidr_block = var.public_subnets
    availability_zone = var.azs[0]
    map_public_ip_on_launch = true
#   [0] é valor do index dentro da lista (type = list(string) na variável "azs") no caso 0 = us-east-2a

    tags = {
        Name = "public-subnet-2a"
    }
}
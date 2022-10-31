output "vpc_id" {
    description = "ID da VPC"
    value = aws_vpc.vpc-terraform.id
}

output "private_subnets" {
    description = "ID da subnet"
    value = aws_subnet.private_subnet.id
}
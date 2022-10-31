resource "aws_instance" "ec2-terraform" {

    ami = var.ami
    vpc_security_group_ids = [aws_security_group.sg-terraform.id]
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    key_name = "lab-tf"

    tags = {
        Name = var.name
    }
}
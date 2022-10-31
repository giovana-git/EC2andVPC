variable "name" {
    type = string
    default = "lab-gi-terraform"
}

variable "ami" {
    type = string
    default = "ami-0fb9091035fd730f9"
}

variable "instance_type" {
    type = string
    default = "t3.micro"  
}

variable "key_name" {
    type = string
    default = "key-lab-gi"
}

variable "subnet_id" {
    type = string
}

variable "vpc_id" {
    type = string
}
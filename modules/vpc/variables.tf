#####   VPC     #######

variable "name" {
    type = string
    default = "lab-gi-terraform"
}

variable "cidr" {
    type = string
    default = "192.168.0.0/16"
}

variable "dns_support" {
    type = string
    default = "true"
}

variable "dns_hostnames" {
    type = string
    default = "true"
}

####    SUBNETS      #####

variable "private_subnets" {
    type = string
    default = "192.168.1.0/24"
}

variable "public_subnets" {
    type = string
    default = "192.168.2.0/24"
}

variable "azs" {
    type = list(string)
    default = [ "us-east-2a", "us-east-2b" ]
}

variable "default_route_tables" {
    type = list(string)
    default = [ "0.0.0.0/0", "192.168.0.0/16"]
}

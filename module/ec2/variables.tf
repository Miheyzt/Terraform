variable "ec2_instance_type" {
    type = string
    default = "t3.micro"
}

variable "ec2_instance_name" {
    type = string
    default = "Mishazt_test"
}

variable "number_of_instances" {
    type = number
    default = "1"
}

variable "ec2_ami_id" {
    type = string
}
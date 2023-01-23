variable "ec2_instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ec2_instance_name" {
  type    = string
  default = "Mishazt"
}

variable "test_prefix" {
  type    = string
  default = "test"
}

variable "number_of_instances" {
  type = number
  default = "1"
}

variable "dev_prefix" {
  type    = string
  default = "dev"
}

variable "vpc_cidr_block" {
    description = "cidr block for vpc"
    type = string
    default = "10.0.0.0/16"
}

variable "tutorial_vpc_name" {
    type = string
    default = "mishazt_vpc"
}

variable "tutorial_igw_name" {
    type = string
    default = "mishazt_igw"
}

variable "subnet_count" {
    description = "number of subnets"
    type = map(number)
    default = {
        public =1,
        private =2
    }
}

variable "public_subnet_cidr_blocks" {
    description = "Available CIDR blocks for public subnets"
    type = list(string)
    default = [
        "10.0.1.0/24",
        "10.0.2.0/24",
        "10.0.3.0/24",
        "10.0.4.0/24"
    ]
}

variable "private_subnet_cidr_blocks" {
    description = "Available CIDR blocks for private subnets"
    type = list(string)
    default = [
        "10.0.101.0/24",
        "10.0.102.0/24",
        "10.0.103.0/24",
        "10.0.104.0/24"
    ]
}

variable "db_username" {
    description = "database master user"
    type = string
    sensitive = true
    default = "mishazt"
}

variable "allocated_storage" {
    type = number
    default = 10
}

variable "database_engine" {
    type = string
    default = "postgres"
}

variable "engine_version" {
    type = string
    default = "12.9"
}

variable "instance_class" {
    type = string
    default = "db.t3.micro"
}

variable "db_name" {
    type = string
    default = "mishazt"
}

variable "skip_final_snapshot" {
    type = bool
    default = true
}

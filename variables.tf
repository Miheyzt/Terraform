variable "aws_region" {
    default = "us-east-1"
}

variable "vpc_cidr_block" {
    description = "cidr block for vpc"
    type = string
    default = "10.0.0.0/16"
}

variable "subnet_count" {
    description = "number of subnets"
    type = map(number)
    default = {
        public =1,
        private =2
    }
}

variable "settings" {
    description = "Configuration settings"
    type = map(any)
    default = {
        "database" = {
            allocated_storage = 10
            engine = "postgres"
            engine_version = "12.9"
            instance_class = "db.t3.micro"
            db_name = "mishazt"
            skip_final_snapshot = true
        },
        "web_app" = {
            count = 1
            instance_type = "t2.micro"
        }
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

variable "my_ip" {
    description = "My ip address"
    type = string
    sensitive = true
}

variable "db_username" {
    description = "database master user"
    type = string
    sensitive = true
}
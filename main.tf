data "aws_ami" "cloud_cobus" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

module "my_ec2_instance" {
  source = "./module/ec2"

  ec2_instance_type   = var.ec2_instance_type
  ec2_instance_name   = var.ec2_instance_name
  number_of_instances = var.number_of_instances
  ec2_ami_id          = data.aws_ami.cloud_cobus.id
}

module "my_vpc" {
  source = "./module/vpc"
  
  ec2_ami_id = data.aws_ami.cloud_cobus.id
  vpc_cidr_block = var.vpc_cidr_block
  tutorial_vpc_name = var.tutorial_vpc_name
  tutorial_igw_name = var.tutorial_igw_name
  subnet_count = var.subnet_count
  public_subnet_cidr_blocks = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
}

module "rds" {
  source = "./module/rds"
  db_username = var.db_username
  db_subnet_group_name = module.my_vpc.aws_subnet_group_name
  vpc_security_group_ids = module.my_vpc.vpc_security_group_ids
}

output "instance_id" {
    value = module.my_ec2_instance.ec2_instance_id
}

output "DB_Name" {
  value = module.rds.db_name
}

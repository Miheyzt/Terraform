resource "aws_vpc" "tutorial_vpc" {
    cidr_block = var.vpc_cidr_block
    enable_dns_hostnames = true
    tags = {
        Name = var.tutorial_vpc_name
    }
}

resource "aws_internet_gateway" "tutorial_igw" {
    vpc_id = aws_vpc.tutorial_vpc.id
    tags = {
        Name = var.tutorial_igw_name
    }
}

resource "aws_subnet" "tutorial_public_subnet" {
    count = var.subnet_count.public
    vpc_id = aws_vpc.tutorial_vpc.id
    cidr_block = var.public_subnet_cidr_blocks[count.index]
    # availability_zone = data.aws_availability_zones.available.names[count.index]
    tags = {
        Name = "tutorial_public_subnet_${count.index}"
    }
}

resource "aws_subnet" "tutorial_private_subnet" {
    count = var.subnet_count.private
    vpc_id = aws_vpc.tutorial_vpc.id
    cidr_block = var.private_subnet_cidr_blocks[count.index]
    #availability_zone = data.aws_availability_zones.available.names[count.index]
    tags = {
        Name = "tutorial+private_subnet_${count.index}"
    }
}

resource "aws_route_table" "tutorial_public_rt" {
    vpc_id = aws_vpc.tutorial_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.tutorial_igw.id
    }
}

resource "aws_route_table_association" "public" {
    count = var.subnet_count.public
    route_table_id = aws_route_table.tutorial_public_rt.id
    subnet_id = aws_subnet.tutorial_public_subnet[count.index].id
}

resource "aws_route_table" "tutorial_private_rt" {
    vpc_id = aws_vpc.tutorial_vpc.id
}

resource "aws_route_table_association" "private" {
    count = var.subnet_count.private
    route_table_id = aws_route_table.tutorial_private_rt.id
    subnet_id = aws_subnet.tutorial_private_subnet[count.index].id
}

resource "aws_security_group" "tutorial_web_sg" {
    name = "tutorial_web_sg"
    description = "security group for tutorial"
    vpc_id = aws_vpc.tutorial_vpc.id
    
    ingress {
        description = "allow all traffic through HTTP"
        from_port = "80"
        to_port = "80"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Allow SSH from my PC"
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "Allow all outbound traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "tutorial_web_sg"
    }
}

resource "aws_security_group" "tutorial_db_sg" {
    name = "tutorial_db_sg"
    description = "Security group for db"
    vpc_id = aws_vpc.tutorial_vpc.id

    ingress {
        description = "allow mysql traffic from only the web sg"
        from_port = "3306"
        to_port = "3306"
        protocol = "tcp"
        security_groups = [aws_security_group.tutorial_web_sg.id]
    }

    tags = {
        Name = "tutorial_db_sg"
    }
}

resource "aws_db_subnet_group" "tutorial_db_subnet_group" {
    name = "tutorial_db_subnet_group"
    description = "DB subnet group for tutorial"
    subnet_ids = [for subnet in aws_subnet.tutorial_private_subnet : subnet.id]
}
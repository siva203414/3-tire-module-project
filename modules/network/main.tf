resource "aws_vpc" "myvpc" {
cidr_block = var.vpc_cidr
enable_dns_support = true
enable_dns_hostnames = true
}
resource "aws_subnet" "public" {
count = length(var.public_subnets)
vpc_id = aws_vpc.myvpc.id
cidr_block = element(var.public_subnets,count.index)
availability_zone = element(var.azs,count.index)
map_public_ip_on_launch = true
}
resource "aws_subnet" "private" {
count = length(var.private_subnets)
vpc_id = aws_vpc.myvpc.id
cidr_block = element(var.private_subnets,count.index)
availability_zone = element(var.azs,count.index)
}
resource "aws_internet_gateway" "mygateway" {
  vpc_id = aws_vpc.myvpc.id
}
resource "aws_security_group" "web" {
  vpc_id = aws_vpc.myvpc.id
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "web-sg"
  }
}
resource "aws_security_group" "web-albsg" {
  vpc_id = aws_vpc.myvpc.id
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "webalb-sg"
  }
}
resource "aws_security_group" "app" {
  vpc_id = aws_vpc.myvpc.id
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "app-sg"
  }
}
  resource "aws_security_group" "db" {
    vpc_id = aws_vpc.myvpc.id
    ingress {
      from_port = 3306
      to_port = 3306
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      Name = "db-sg"
    }
  }

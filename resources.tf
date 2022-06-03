## AWS RESOURCES ##
# Networking #
# vpc
resource "aws_vpc" "vpc_1" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = "true"

    tags = {
      "Name" = "VPC-1"
    }
}

# Internet gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc_1.id

    tags = {
      "Name" = "igw-VPC-1"
    }  
}

# Subnet 1
resource "aws_subnet" "subnet_1" {
    vpc_id = aws_vpc.vpc_1.id
    cidr_block = "10.0.0.0/24"
    map_public_ip_on_launch = "true"

    tags = {
        Name = "Subnet_public-VPC-1"
    }  
}

# Route table
resource "aws_route_table" "rt_1" {
    vpc_id = aws_vpc.vpc_1.id

    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
    }
}
# Route table association
resource "aws_route_table_association" "rt_subnet_1" {
    subnet_id = aws_subnet.subnet_1.id
    route_table_id = aws_route_table.rt_1.id  
}

# Security group
resource "aws_security_group" "security_group_http" {
    name = "http_security_group"
    description = "Security group for HTTP and HTTPS"
    vpc_id = aws_vpc.vpc_1.id

    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        cidr_blocks = [ "0.0.0.0/0" ]
        protocol = "tcp"
    }  
    ingress = {
      description = "HTTPS"
      from_port = 442
      to_port = 442
      cidr_blocks = [ "0.0.0.0/0" ]
      protocol = "tcp"
      }
    
    egress = {
      from_port = 0
      to_port = 0
      cidr_blocks = [ "0.0.0.0/0" ]
      protocol = -1
    }

    tags = {
      "Name" = "HTTP-Security_group"
    }
}

# EC2
resource "aws_instance" "EC2_1" {
    ami = "" #Choice -> Have to select image
    instance_type = "" #Choice -> Have to select instance type (t2.micro, t2.nano, etc)
    subnet_id = aws_subnet.subnet_1.id
    vpc_security_group_ids = [ aws_security_group.security_group_http.id ]
  
}
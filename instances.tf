/* <--- Delete for EC2 instance creation in each public subnet


# EC2
resource "aws_instance" "EC2_1" {
    count = 3 
    ami = "" #Choice -> Have to select image
    instance_type = "" #Choice -> Have to select instance type (t2.micro, t2.nano, etc)
    subnet_id = aws_subnet.public_subnets[count.index].id
    vpc_security_group_ids = [ aws_security_group.security_group_http.id ]

    tags = {
      Name = "EC2-${count.index}-${local.common_tags.Project}"
    }
}


Delete for EC2 instance creation in each public subnet ---> */

# EC2
resource "aws_instance" "EC2_1" {
    count = var.instance_quantity
    ami = "ami-052efd3df9dad4825" #Choice -> Have to select image
    instance_type = "t2.micro" #Choice -> Have to select instance type (t2.micro, t2.nano, etc)
    subnet_id = aws_subnet.public_subnets[count.index].id
    vpc_security_group_ids = [ aws_security_group.security_group_http.id ]

    tags = {
      Name = "EC2-${count.index}-${local.common_tags.Project}"
    }
}

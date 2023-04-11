#Creating Security Group to Create EC2
resource "aws_security_group" "sg" {
  name        = "Security_Group"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.demo.id

  #Allow Inbound Rules (Enabling all ports of TCP)
  ingress {
    description = "TLS from VPC"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Allow Inbound Rules (Enabling TCP Port-80)
  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Allow Inbound Rules (Enabling TCP Port-22)
  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Allow Outbound Rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name          = "Terraform _Security"
    instance_name = "Terraform_Instance"
  }
}
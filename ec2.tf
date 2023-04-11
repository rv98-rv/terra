resource "aws_instance" "ec2" {
  ami                    = "ami-07d3a50bd29811cd1"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name               = "terraform_key"
  subnet_id              = aws_subnet.demo1.id

  tags = {
    Name = "Terraform_Instance"
  }
}
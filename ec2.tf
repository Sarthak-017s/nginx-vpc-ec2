resource "aws_instance" "nginxserver" {
  ami           = "ami-0427090fd1714168b"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public-subnet.id
  vpc_security_group_ids = [ aws_security_group.nginx-sg.id ]
  associate_public_ip_address = true

  user_data = <<-EOF
            #!/bin/bash
            sudo yum install nginx -y
            sudo systemctl start nginx
            EOF


  tags = {
    Name = "NginxServer"
  }
}
/*
resource "aws_instance" "ub-server" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = "jen"

// adding storage.
  ebs_block_device {
    device_name = "/dev/sdf"
    volume_type = "gp2"
    volume_size = 10
  }

// adding user data script.
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "hello tf"
    First = "cjeck tag"
  }
}

data "aws_vpc" "existing_vpc" {
  id = var.vpc_id
}
*/

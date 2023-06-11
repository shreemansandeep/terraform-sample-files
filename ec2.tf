
resource "aws_instance" "ub-server" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = "jen"

  ebs_block_device {
    device_name = "/dev/sdf"
    volume_type = "gp2"
    volume_size = 10
  }

  tags = {
    Name = "hello tf"
    First = "cjeck tag"
  }
}

data "aws_vpc" "existing_vpc" {
  id = var.vpc_id
}

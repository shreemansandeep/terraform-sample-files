/*
// Creating a VPC
resource "aws_vpc" "tfvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "tf_tfvpc"
  }
}


// Creating a Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.tfvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "tf_pubsub"
  }
}


// Creating a Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.tfvpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "tf_prsub"
  }
} 


// Creating a Internet Gateway
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.tfvpc.id

  tags = {
    Name = "tf_igw"
  }
}


// Creating a Nat Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "tf_mynatgw"
  }
}


// Elastic IP should be associated with a VPC 
resource "aws_eip" "nat" {
  vpc = true
}


// Creating a Public route table and associated with a Internet Gateway
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.tfvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }

  tags = {
    Name = "tf_public-rt"
  }
}


// Creating a Private route table and associated with a Nat Gateway
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.tfvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "tf_private-rt"
  }
}


// associating Public route table to Public subnet
resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}


// associating Private route table to Private subnet
resource "aws_route_table_association" "private_route_table_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}


// Launching a webserver in Public subnet
resource "aws_instance" "web" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "web-server"
  }
}


// Launching a dbserver in Private subnet
resource "aws_instance" "db" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id

  tags = {
    Name = "db-server"
  }
}

*/

variable "vpc_id" {
  type = string
  default = "vpc-06131ac4032e92bb0"
}

variable "ami" {
    type = string
    default = "ami-0f5ee92e2d63afc18"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "region" {
    type = string
    default = "ap-south-1"
}

variable "iam_instance_profile" {
    type = string
    default = "eksClusterRole"
}
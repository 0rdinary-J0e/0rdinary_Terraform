variable "aws_region" {
  default = "us-west-2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnet_ids" {
  type = list(string)
  default = [ "ordinaryjoe-app-public-subnet-1", "ordinaryjoe-app-public-subnet-2", "ordinaryjoe-app-private-subnet-1", "ordinaryjoe-app-private-subnet-2" ]
}

variable "aws_region" {
  default = "us-west-2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnet_ids" {
  type = list(string)
  default = [ "ordinaryjoe-uat-public-subnet-1", "ordinaryjoe-uat-public-subnet-2", "ordinaryjoe-uat-private-subnet-1", "ordinaryjoe-uat-private-subnet-2", "ordinaryjoe-uat-private-subnet-3" ]
}

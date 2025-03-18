# Define the VPC
resource "aws_vpc" "ordinaryjoe_app" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "ordinaryjoe-app-vpc"
  }
}

# Define Public and Private Subnets
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.ordinaryjoe_app.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = var.subnet_id[0]
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.ordinaryjoe_app.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = var.subnet_id[1]
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.ordinaryjoe_app.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = var.subnet_id[2]
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.ordinaryjoe_app.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = var.subnet_id[3]
  }
}

# Internet Gateway for public subnets
resource "aws_internet_gateway" "ordinaryjoe_app_igw" {
  vpc_id = aws_vpc.ordinaryjoe_app.id
  tags = {
    Name = "ordinaryjoe-app-igw"
  }
}

# Public Route Table with route to Internet Gateway
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.ordinaryjoe_app.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ordinaryjoe_app_igw.id
  }
  tags = {
    Name = "ordinaryjoe-app-public-rt"
  }
}

# Route Table Associations for Public Subnets
resource "aws_route_table_association" "public_subnet_assoc_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet_assoc_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

# Security Groups
resource "aws_security_group" "vpc_web_sg" {
  vpc_id = aws_vpc.ordinaryjoe_app.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ordinaryjoe-web-sg"
  }
}

resource "aws_security_group" "vpc_app_sg" {
  vpc_id = aws_vpc.ordinaryjoe_app.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # Allow internal traffic
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ordinaryjoe-app-sg"
  }
}

resource "aws_security_group" "lambda_sg" {
  vpc_id = aws_vpc.ordinaryjoe_app.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ordinaryjoe-lambda-sg"
  }
}

# --- Data sources --- 
// Account 3
data "aws_vpc" "default_vpc_3" {
  provider = aws.admin_3
  default = true
}

data "aws_subnets" "default_subnets_3" {
  provider = aws.admin_3
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc_3.id]
  }
}

// Account 2
data "aws_vpc" "default_vpc_2" {
  provider = aws.admin_2
  default = true
}

data "aws_subnets" "default_subnets_2" {
  provider = aws.admin_2
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc_2.id]
  }
}

// Account 1
data "aws_vpc" "default_vpc_1" {
  provider = aws.admin_1
  default = true
}

data "aws_subnets" "default_subnets_1" {
  provider = aws.admin_1
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc_1.id]
  }
}
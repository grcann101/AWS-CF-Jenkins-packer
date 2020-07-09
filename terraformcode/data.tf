data "aws_subnet" "subnets-aza" {
  vpc_id = var.vpc-id
  availability_zone = "eu-west-2a"
}


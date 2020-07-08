

module "server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = var.rancher-name 
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = var.vpc-id 

  ingress_cidr_blocks = [var.rancher-vpc-cidr,]
}
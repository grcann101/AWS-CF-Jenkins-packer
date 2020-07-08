

module "server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = $rancher-name 
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = $vpc-id 

  ingress_cidr_blocks = [$rancher-vpc-cidr,]
}
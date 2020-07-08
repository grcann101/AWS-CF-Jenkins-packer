#-------------------------------------------------------------------------------
#  Variables for Rancher V2
#  created by Graham Cann 29/05/2018
#  update for moorit 23/01/2019
#  added helm vars GC 30/05/2019
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# aws variables for Rancher V2.0.0 HA Server environment
# the keys are input and not stored in the configuration for security reasons.
#-------------------------------------------------------------------------------
variable "access_key" {
}

variable "secret_key" {
}

variable "region" {
  default = "eu-west-2"
}

variable "my_ip_address" { # the ip address of your PC
}

#-------------------------------------------------------------------------------
#aws variables for Rancher V2.* HA Server environment
#-------------------------------------------------------------------------------
variable "rancher-name" { # name for the setup change for new cluster
  default = "rancherlondon"
}

variable "rancher-environment" { # developement or production
  default = "Development"
}

variable "label-az1" { # labels for nodes (ec2 instances)
  default = "rancher-os-ha-2a"
}

variable "label-az2" {
  default = "rancher-os-ha-2b"
}

variable "label-az3" {
  default = "rancher-os-ha-2c"
}

variable "rancher-ami" { #  rancher 1.5.1
  default = "ami-00d503d7ef22da04a"
}
variable "rancher-bastion-ami" { #  bastion CIS hardened AMI
  default = "ami-03603cffd09f888ee"
}
variable "rancher-type" { # aws instance type
  default = "t2.micro"
}

variable "rancher-key" { # access key name for *.pem file
  default = "rancherlonv2"
}

variable "rancher-key-path" { # access key path
  default = "~/terraform/terraform-london"
}

variable "rancher-sg-name" { # storage group id
  default = "rancher-nodes-lon"
}

variable "rancher-iam" { # IAM role to use for access
  default = "ec2-s3"
}

#-------------------------------------------------------------------------------
#network variables
#-------------------------------------------------------------------------------
variable "route53-zone" { # *..cloud route id Z1E49TJ4RWU1JF public
  default = "Z3VULFCKII1Q72"
}

variable "route53-hosted-zone" { # entries under the .cloud have this hosted zone id
  default = "Z3VULFCKII1Q72"
}

variable "route53-name" { # route53 a record name
  default = "rancherlon.moorit.cloud"
}
variable "route53-name-vault" { # route53 a record name
  default = "vaultlon.moorit.cloud"
}
variable "route53-name-jenkins" { # route53 a record name
  default = "jenkinslon.moorit.cloud"
}
variable "route53-name-aqua" { # route53 a record name
  default = "aqualon.moorit.cloud"
}
variable "route53-name-consul" { # route53 a record name
  default = "consullon.moorit.cloud"
}

variable "lb-name" { # load balancer a record name
  default = "rancherlon-alb"
}
variable "lb-name-vault" { # load balancer a record name
  default = "vaultlon-alb"
}
variable "lb-name-jenkins" { # load balancer a record name
  default = "jenkinslon-alb"
}
variable "lb-name-aqua" { # load balancer a record name
  default = "aqualon-alb"
}
variable "lb-name-consul" { # load balancer a record name
  default = "consul-alb"
}
variable "az1" { # az for subnet a
  default = "eu-west-2a"
}

variable "az2" { # az for subnet b
  default = "eu-west-2b"
}

variable "az3" { # az for subnet c
  default = "eu-west-2c"
}
variable "rancher-vpc-cidr" { # cidr for the subnet in az 1a give 256 addresses
  default = "172.31.0.0/16"
}


variable "cidr-az1" { # cidr for the subnet in az 1a give 256 addresses
  default = "172.31.16.0/20"
}

variable "cidr-az2" { # cidr for the subnet in az 1b
  default = "172.31.32.0/20"
}

variable "cidr-az3" { # cidr for the subnet in az 1c
  default = "172.31.0.0/20"
}

variable "cidr-bastion-az3" { # cidr for the subnet in az 1c bastion
  default = "10.10.80.0/24"
}

variable "sub-az1-name" { # az 1a
  default = "rancherl-1a"
}

variable "sub-az2-name" { # az 1b
  default = "rancherl-1b"
}

variable "sub-az3-name" { # az 1c
  default = "rancherl-1c"
}


variable "virtual-gateway" { # not used yet virtual gateway id for route table
  default = "vgw-000000000000000000"
}

variable "rancher-tls-cert-arn" { # arn for the tls certificate installed or via ACM
  default = "arn:aws:acm:eu-west-1:123079479499:certificate/68d22082-29e8-4585-911d-ab706f521cfa"
}

#-------------------------------------------------------------------------------
#aws variables to change docker to a supported version for rancher
#-------------------------------------------------------------------------------

variable "rancher-user" {
  default = "rancher"
}

variable "rancher-ssh-key" {
  default = "rancherv2.pem"
}

variable "rancher-pkey" {
  default = ""
}

variable "rancher-pcert" {
  default = ""
}

#-------------------------------------------------------------------------------
# logging variables
#-------------------------------------------------------------------------------
variable "rancher-lb-log" { # bucket for the load balancer log files
  default = "rancher-v2-logs-moorit.cloud"
}

#------------------
# end of variables
#------------------

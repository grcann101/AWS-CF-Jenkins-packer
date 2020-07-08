#-------------------------------------------------------------------------------
#  Create a new kubernetes cluster to host the Rancher-V2 application.
#  the ami uses RancherOS on a t2.medium instance 4gb of storage required
#  created by Graham Cann 29/05/2018
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# aws access keys
#-------------------------------------------------------------------------------

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

#=================================AZ-1A==============================================
#-------------------------------------------------------------------------------
# create aws instance from the rancheros ami other ami  ami-1686b3fd
#-------------------------------------------------------------------------------

resource "aws_instance" "rancher-instance-1" { # end of resource block
  ami           = var.rancher-ami
  instance_type = var.rancher-type
  subnet_id     = aws_subnet.rancher-a.id
  key_name      = var.rancher-key
  security_groups             = [aws_security_group.rancher-sg.id]
  iam_instance_profile        = var.rancher-iam
  associate_public_ip_address = true

  tags = {
    Name        = var.label-az1
    Owner       = "PlatOps Team"
    cost-centre = "IT Developement"
    "kubernetes.io/cluster/local" = "owned"
    "failure-domain.beta.kubernetes.io/zone" = "eu-west-1a"
    "failure-domain.beta.kubernetes.io/region" = "eu-west-1"
  }

}

output "ip1" { # output the IP address of the instance for use in the rke file
  value = aws_instance.rancher-instance-1.public_ip
}

#=================================AZ-1b==============================================
#-------------------------------------------------------------------------------
# create aws instance from the rancheros ami other ami  ami-1686b3fd
#-------------------------------------------------------------------------------

resource "aws_instance" "rancher-instance-2" { # end of resource block
  ami           = var.rancher-ami
  instance_type = var.rancher-type
  subnet_id     = aws_subnet.rancher-b.id
  key_name      = var.rancher-key
  security_groups             = [aws_security_group.rancher-sg.id]
  iam_instance_profile        = var.rancher-iam
  associate_public_ip_address = true

  tags = {
    Name        = var.label-az2
    Owner       = "PlatOps Team"
    cost-centre = "IT Developement"
    "kubernetes.io/cluster/local" = "owned"
    "failure-domain.beta.kubernetes.io/zone" = "eu-west-1b"
    "failure-domain.beta.kubernetes.io/region" = "eu-west-1"
  }

}

output "ip2" { # output the IP address of the instance for use in the rke file
  value = aws_instance.rancher-instance-2.public_ip
}

#=================================AZ-1c==============================================
#-------------------------------------------------------------------------------
# create aws instance from the rancheros ami other ami  ami-1686b3fd
#-------------------------------------------------------------------------------

resource "aws_instance" "rancher-instance-3" { # end of resource block
  ami           = var.rancher-ami
  instance_type = var.rancher-type
  subnet_id     = aws_subnet.rancher-c.id
  key_name      = var.rancher-key
  security_groups             = [aws_security_group.rancher-sg.id]
  iam_instance_profile        = var.rancher-iam
  associate_public_ip_address = true

  tags = {
    Name        = var.label-az3
    Owner       = "PlatOps Team"
    cost-centre = "IT Developement"
    "kubernetes.io/cluster/local" = "owned"
    "failure-domain.beta.kubernetes.io/zone" = "eu-west-1c"
    "failure-domain.beta.kubernetes.io/region" = "eu-west-1"
  }

}

output "ip3" { # output the IP address of the instance for use in the rke file
  value = aws_instance.rancher-instance-3.public_ip
}
#=================================AZ-1c==Bastion============================================
#-------------------------------------------------------------------------------
# create aws bastion instance from the rancheros ami CIS hardened AMI
#-------------------------------------------------------------------------------

resource "aws_instance" "rancher-bastion-london" { # end of resource block
  ami           = var.rancher-bastion-ami
  instance_type = var.rancher-type
  subnet_id     = aws_subnet.rancher-c.id
  key_name      = var.rancher-key
  security_groups             = [aws_security_group.rancher-sg.id]
  iam_instance_profile        = var.rancher-iam
  associate_public_ip_address = true

  tags = {
    Name        = "Bastion-London"
    Owner       = "PlatOps Team"
    cost-centre = "IT Developement"
  }

}

output "ip-bastion" { # output the IP address of the instance for use in the rke file
  value = aws_instance.rancher-bastion-london.public_ip
}

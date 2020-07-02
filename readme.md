# The Stack creates a jenkins master server 
# with Auto Scaling an LB Sec groups 
# And attaches an EFS file system for the Jenkins Home dir
# Java & Jenkins are installed and started after the efs mount.
# By Graham Cann  Works 02/07/2020

# AWS Commands


## -validate----------
aws cloudformation validate-template --template-body file://F:\AWS\jenkins-server\cf-scp-server-stack.yml


## -create stack --------------------

aws cloudformation create-stack --stack-name jenkins --template-body file://cf-scp-server-stack.yml --parameters  file://jenkins.json --capabilities CAPABILITY_IAM 

## -change set --------------------

aws cloudformation create-change-set --change-set-name secgroup --stack-name jenkins --template-body file://cf-scp-server-stack.yml --parameters  file://jenkins.json --capabilities CAPABILITY_IAM 


## -update stack --------------------

aws cloudformation update-stack --stack-name jenkins --template-body file://cf-scp-server-stack.yml --parameters  file://jenkins.json --capabilities CAPABILITY_IAM 




## cf init log for boot commands

cat /var/log/cfn-init-cmd.log


## Example mount Commands for the efs

mount -t efs fs-a894ed59.efs.eu-west-2.amazonaws.com:/ /var/lib/jenkins

umount /efs



sh '
packer build -var aws_access_key=${AWS_KEY} -var aws_secret_key=${AWS_SECRET} -var packer_build=${packer_build}



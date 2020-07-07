# Jenkins on EC2 ASG , ELB , SG with EFS for Jenkins Home 
 The Stack creates a jenkins master server 
 with Auto Scaling an LB Sec groups 
 And attaches an EFS file system for the Jenkins Home dir
 Java & Jenkins are installed and started after the efs mount.
 By Graham Cann  Works 02/07/2020

# AWS CloudFormation Commands


## -validate----------
```
aws cloudformation validate-template --template-body file://F:\AWS\jenkins-server\cf-scp-server-stack.yml
```

## -create stack --------------------
```
aws cloudformation create-stack --stack-name jenkins --template-body file://cf-scp-server-stack.yml --parameters  file://jenkins.json --capabilities CAPABILITY_IAM 
```
## -change set --------------------
```
aws cloudformation create-change-set --change-set-name secgroup --stack-name jenkins --template-body file://cf-scp-server-stack.yml --parameters  file://jenkins.json --capabilities CAPABILITY_IAM 
```

## -update stack --------------------
```
aws cloudformation update-stack --stack-name jenkins --template-body file://cf-scp-server-stack.yml --parameters  file://jenkins.json --capabilities CAPABILITY_IAM 
```

# Files

| --- | --- |
|cf-jenkins-server-stack.yml | CF code to build service | 
| --- | --- | 
|jenkins.json | CF Parameters for the above stack | 
|packer.json | Packer Command to build the AMI | 
|build_script.sh | Software install for the LAMP stack | 
|jenkins-pipe-packer-go | Jenkins pipeline to Run the build |
| --- | --- |



## cf init log for boot commands

cat /var/log/cfn-init-cmd.log


## Example mount Commands for the efs

mount -t efs fs-a999999.efs.eu-west-2.amazonaws.com:/ /var/lib/jenkins

umount /efs



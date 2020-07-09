# jenkins frestyle project scripts

The *.sh files should be copied into the build type of shell in a freestyle project
The preq steps are:
Variables for the build
Git repo acces for the controll scripts
AWS credentials step to access AWS from the creds

The *.xml files can be copied into the jenkins jobs files /var/lib/jenkins/jobs/ 
will create the entire project. For experienced user only.

# Files

|File |Description |  
| --- | --- | 
|jenkins-pipeline-packer.sh | Jenkins SH script to install and run packer to build an AMI | 
|jenkins-pipeline-terraform.sh | Jenkins Shell script to install and run terraform | 
|jenkins-packer.xml | copy into a project in eg: var/lib/jenkins/jobs/Packer-Build | 
|jenkins-terraform.xml | copy into a project in eg: var/lib/jenkins/jobs/Terraform-Build  | 







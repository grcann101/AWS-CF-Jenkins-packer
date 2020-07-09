ls -la ;

#!/usr/bin/env bash

# Select Jenkins free form project then add these steps 
# check box this build is parameterized   setup parameter build_script
# check box SCM GIT add repo and setup access key in github
# check box Build Environment  use secret text or files and add AWS keys
# Build step copy this code into the build step box type execute Shell script
# By Graham Cann works 08/07/2020




# Download Terraform if module does not exits already

if [ -f "./terraform" ]; then
    echo "terraform exists."
else 
	echo "Downloading $terraform_url."
	curl -o terraform.zip https://releases.hashicorp.com/terraform/$version/terraform_$version\_linux_amd64.zip\ 
	# Unzip and install
	unzip terraform.zip
fi
# initalize terraform 

./terraform -version
./terraform init $directory

# run the plan  or apply

./terraform $action -var access_key=$AWS_ACCESS_KEY_ID -var secret_key=$AWS_SECRET_ACCESS_KEY -var region=$region $directory



echo 'end of Terraform Build;'
ls -la





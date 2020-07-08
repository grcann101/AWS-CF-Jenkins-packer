ls -la ;
which packer;
#!/usr/bin/env bash

# Select Jenkins free form project then add these steps 
# check box this build is parameterized   setup parameter build_script
# check box SCM GIT add repo and setup access key in github
# check box Build Environment  use secret text or files and add AWS keys
# Build step copy this code into the build step box type execute Shell script


# Install JQ 

if [ -f "/usr/bin/jq" ]; then
    echo "jq exists."
else
    wget -O jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
    sudo chmod +x ./jq
    sudo cp jq /usr/bin
fi
# Get URLs for most recent versions
# For Linux

terraform_url=$(curl https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "linux.*amd64" | sort --version-sort -r | head -1 | awk -F[\"] '{print $4}')
packer_url=$(curl https://releases.hashicorp.com/index.json | jq '{packer}' | egrep "linux.*amd64" | sort --version-sort -r | head -1 | awk -F[\"] '{print $4}')



# Download Terraform. URI: https://www.terraform.io/downloads.html
if [ -f "./terraform" ]; then
    echo "terraform exists."
else 
    echo "Downloading $terraform_url."
	curl -o terraform.zip $terraform_url
	# Unzip and install
	unzip terraform.zip
fi

if [ -f "./packer" ]; then
    echo "packer exists."
else 
    # Download Packer. URI: https://www.packer.io/downloads.html
    echo "Downloading $packer_url."
    curl -o packer.zip $packer_url
    # Unzip and install
    unzip packer.zip
fi

export PACKER_LOG=1;
export PACKER_LOG_PATH=$WORKSPACE/packer.log;
echo "packer log path:" $PACKER_LOG_PATH;
sudo ./packer -machine-readable version ;
sudo ./packer build -var aws_access_key=$AWS_ACCESS_KEY_ID -var aws_secret_key=$AWS_SECRET_ACCESS_KEY -var packer_build_script=$build_script -var source-ami=$sourceami -var ami-name=$aminame -var region=$region -var sec-group=$secgroup ./packer.json ;
echo 'end of run;'
ls -la





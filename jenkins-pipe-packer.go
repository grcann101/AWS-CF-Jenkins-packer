ls -la ;
which packer;
#!/usr/bin/env bash
# Script prerequisite > install jq > https://stedolan.github.io
# ********************************************************************************************
# UPDATE: Check out Robert's repo here https://github.com/robertpeteuil/terraform-installer
#   Robert's repo is more built out and has more options around the installation process.
#   Cheers!  -Adron
# ********************************************************************************************

wget -O jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
sudo chmod +x ./jq
sudo cp jq /usr/bin
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
sudo ./packer -machine-readable version
sudo ./packer build ./packer.json -var aws_access_key=$AWS_ACCESS_KEY_ID -var aws_secret_key=$AWS_SECRET_ACCESS_KEY -var packer_build=$build_script ;
echo 'end of run;'
ls -la





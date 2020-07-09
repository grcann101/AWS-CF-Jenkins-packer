ls -la ;

#!/usr/bin/env bash

# Select Jenkins free form project then add these steps 
# check box this build is parameterized   setup parameter build_script
# check box SCM GIT add repo and setup access key in github
# check box Build Environment  use secret text or files and add AWS keys
# Build step copy this code into the build step box type execute Shell script
# By Graham Cann  works 02/07/2020


# download packer from the hasicorp site if not already downloaded

if [ -f "./packer" ]; then
    echo "packer exists."
else 
    # Download Packer. URI: https://www.packer.io/downloads.html
    echo "Downloading Packer $version "
    curl -o packer.zip https://releases.hashicorp.com/packer/$version/packer_$version/_linux_amd64.zip / 
    # Unzip and install
    unzip packer.zip
fi

export PACKER_LOG=1;
export PACKER_LOG_PATH=$WORKSPACE/packer.log;
echo "packer log path:" $PACKER_LOG_PATH;

# show packer version
sudo ./packer -machine-readable version ;

# run packer build 
sudo ./packer build -var aws_access_key=$AWS_ACCESS_KEY_ID -var aws_secret_key=$AWS_SECRET_ACCESS_KEY -var packer_build_script=$build_script -var source-ami=$sourceami -var ami-name=$aminame -var region=$region -var sec-group=$secgroup ./packercode/packer.json ;

echo 'end of Packer Build AMI ;'
ls -la






#==============================================================================
# Title: install.sh
# Description: Install everything necessary for Docker in TX2.
# Author: Afi Hisam <afihisam95@gmail.com>
# Date: 20180323
# Version : 1.01
# Usage: bash install.sh
# NOTES: There are certain steps to be taken in the system before installing 
#        via this script (refer to README): Run 
#        `sudo gedit /etc/apt/sources.list` and change the line 
#        `deb http://us.archive.ubuntu.com/ubuntu/ xenial main restricted` to 
#        `deb http://us.archive.ubuntu.com/ubuntu/ xenial main universe`
#==============================================================================

# Exit script if any command fails
set -e 
set -o pipefail

if [ $# -ne 0 ]
  then
    echo "Usage: install.sh"
    exit 1
fi

cd ..

# Set up the docker repository
echo "Installing docker repository..."

sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

echo "docker repository installed."

# Install Docker CE
echo "Install Docker CE..."

sudo apt-get update
sudo apt-get install docker-ce

echo "Docker CE installed."

# Verify the installation
echo "Verify the installation by installing hello-world images..."
sudo docker run hello-world 
echo "Installation completed."

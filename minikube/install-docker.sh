#old
sudo apt install  -y docker.io
sudo usermod -aG docker $USER && newgrp docker
#old

#based on https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
 $ sudo apt-get install -y docker-ce docker-ce-cli containerd.io
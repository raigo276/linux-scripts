#! /bin/bash
sudo apt-get update
sudo apt-get install build-essential checkinstall libssl-dev -y
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

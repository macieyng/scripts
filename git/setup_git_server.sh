#!/bin/bash

echo "Setting up git server started!"

echo "Creating git user..."
sudo -u root adduser --gecos "" git
sudo -u root usermod -aG sudo git
if ! command -v git &> /dev/null
then
    echo "Warning: 'git' command not found"
    echo "Installing git..."
    sudo -u root apt-get install git -y
fi


echo "Creating ssh files and directories..."
sudo -u root mkdir ~/.ssh
sudo -u root chmod 700 ~/.ssh
sudo -u root touch ~/.ssh/authorized_keys
sudo -u root chmod 600 ~/.ssh/authorized_keys

echo "Creating server directories..."
sudo -u root mkdir -p /srv/git/
sudo -u root chown git /srv/git/

echo "Git server is ready!"
#!/bin/bash

REPO_NAME=$1

echo "Setting up $REPO_NAME.git repository..."

echo "Creating repository directory..."
sudo -u git mkdir -p /srv/git/$REPO_NAME.git

echo "Initializing git repository..."
echo ""
cd /srv/git/$REPO_NAME.git/
sudo -u git git init --bare

echo ""
echo "Repository is ready!"
echo "Add this repo as your origin:"
echo "    git remote add origin git@$(hostname -I | awk '{print $1}'):$(pwd)"

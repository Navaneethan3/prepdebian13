#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Add the Flathub repository
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Download and add Brave browser keyring
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

# Add Brave browser repository
sudo curl -fsSLo /etc/apt/sources.list.d/brave-browser-release.sources https://brave-browser-apt-release.s3.brave.com/brave-browser.sources

# Update package list
sudo apt update

# Install wget and apt-transport-https
sudo apt install -y wget apt-transport-https 

# Download Element IO keyring
sudo wget -O /usr/share/keyrings/element-io-archive-keyring.gpg https://packages.element.io/debian/element-io-archive-keyring.gpg 

# Add Element IO repository
echo "deb [signed-by=/usr/share/keyrings/element-io-archive-keyring.gpg] https://packages.element.io/debian/ default main" | sudo tee /etc/apt/sources.list.d/element-io.list

# Update package list again
sudo apt update

# Install Element desktop client and Brave browser
sudo apt install -y element-desktop brave-browser

echo "Installation complete!"

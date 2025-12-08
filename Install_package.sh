#!/bin/bash

# Update package list
sudo apt update

# Define the packages to install
packages=("xfce4-terminal" "firefox" "vim")
failed_packages=()

# Install each package
for package in "${packages[@]}"; do
    sudo apt install -y "$package"

    # Check if the installation was successful
    if [ $? -ne 0 ]; then
        echo "Error: Installation of $package failed."
        failed_packages+=("$package")
    else
        echo "$package installed successfully."
    fi
done

# Check if there were any failed installations
if [ ${#failed_packages[@]} -ne 0 ]; then
    echo "The following packages were not installed: ${failed_packages[*]}"
    exit 1
else
    echo "All packages installed successfully."
fi

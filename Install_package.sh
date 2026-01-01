#!/bin/bash

# Update package list
sudo apt update

# Define the packages to install
packages=( "adwaita-icon-theme-legacy" "curl" "clang" "emacs" "fd-find" "findutils" "flatpak" "git" "gnome-boxes"
"gedit" "gpaste-2" "plymouth-x11" "vim" "xfce4-terminal" ) 
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

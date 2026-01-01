#!/bin/bash

# Update the package list and install Flatpak if not already installed
if ! command -v flatpak &> /dev/null
then
    echo "Flatpak not found. Installing..."
    sudo apt update
    sudo apt install -y flatpak
else
    echo "Flatpak is already installed."
fi

# Add the Flathub repository
if ! flatpak remote-list | grep -q "flathub"
then
    echo "Adding Flathub repository..."
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
else
    echo "Flathub repository is already added."
fi

# List of apps to install
APPS=(
    "org.videolan.VLC"  # VLC Media Player
    "com.visualstudio.code"  # VS Code
    "org.gimp.GIMP"  # GIMP Image Editor
)

# Install each app
for APP in "${APPS[@]}"; do
    if ! flatpak list | grep -q "$APP"; then
        echo "Installing $APP..."
        flatpak install -y flathub "$APP"
    else
        echo "$APP is already installed."
    fi
done

echo "All specified apps are installed or already present."

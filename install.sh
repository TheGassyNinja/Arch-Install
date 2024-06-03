#!/bin/bash
# This script is meant to be run after a fresh install of Arch Linux - Xorg
# It will install the necessary packages and configure the system
# set -x
# Check for vim and install if needed
if ! command -v vim &> /dev/null; then
    echo "Vim is not installed. Installing..."
    sudo pacman -S vim
else
    echo "Vim is already installed."
fi
EDITOR="/usr/bin/vim"


# Install necessary packages
    # check for package.txt file and give option to edit it
    # check for yay and install it if not present
    # check for yay packages and install them
    # Check for package.txt file and give option to edit
    if [ -f package.txt ]; then
        echo "package.txt file found."
        echo "Remove the # from the beginning of the lines to install the packages."
        echo ""
        read -p "Do you want to edit the package.txt file? (y/n): " choice
        if [ "$choice" == "y" ]; then
            $EDITOR package.txt
            clear
            # echo package list (packages without #) and confirm before installing
            echo "The following packages will be installed:"
            grep -v "#" package.txt
            read -p "Do you want to continue with the installation? (y/n): " choice
            if [ "$choice" == "y" ]; then
                clear
                sudo pacman -S --needed $(grep -v "#" package.txt) && sleep 2 && clear
            fi
        else
            clear
            # echo package list (packages without #) and confirm before installing
            echo "The following packages will be installed:"
            grep -v "#" package.txt
            read -p "Do you want to continue with the installation? (y/n): " choice
            if [ "$choice" == "y" ]; then
                clear
                sudo pacman -S --needed $(grep -v "#" package.txt) && sleep 2 && clear
            fi
        fi

    else
        echo "package.txt file not found."
    fi
# Install yay
if ! command -v yay &> /dev/null; then
    echo "Yay is not installed. Installing..."
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
else
    echo "Yay is already installed."
fi
# Check for AUR.txt file and give option to edit
if [ -f AUR.txt ]; then
    echo "AUR.txt file found."
    echo "Remove the # from the beginning of the lines to install the AUR packages."
    echo ""
    read -p "Do you want to edit the AUR.txt file? (y/n): " choice
    if [ "$choice" == "y" ]; then
        $EDITOR AUR.txt
    # echo AUR package list (packages without #) and confirm before installing
    echo "The following AUR packages will be installed:"
    grep -v "#" AUR.txt
    read -p "Do you want to continue with the installation? (y/n): " choice
        if [ "$choice" == "y" ]; then
            yay -S --needed $(grep -v "#" AUR.txt)
        fi
        fi

    echo "AUR.txt file not found."
fi

# Git configurations
#cd ~/Git
#git clone https://github.com/thegassyninja/arch-dots
#cd arch-dots
# cp files to appropriate directories











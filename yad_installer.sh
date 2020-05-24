#!/bin/bash

echo 'Preparing to install YAD...'
echo ''

# Check distro
distro=$(uname -a)

# check install command based on distro
if [[ $distro == *Ubuntu* || $distro == *ubuntu* ]]; then
    update_cmd="sudo apt update -y"
    install_cmd="sudo apt install yad -y"
elif [[ $distro == *archlinux* ]]; then
    update_cmd="sudo pacman -Sy --noconfirm"
    install_cmd="sudo pacman -S yad --noconfirm"
else
    echo 'your linux distro is not supported by this script yet, please, install YAD manualy and try again:'
    echo ''
    echo 'press ENTER to exit'
    read enter
    exit
fi

echo "Updating system..."
sudo $update_cmd

echo "Installing YAD..."
echo $install_cmd

sudo $install_cmd


echo ''
echo 'finished! press ENTER to continue'
read enter

# xterm -T YadBomb -e /bin/bash -c "echo $missing_packages && echo 'please, install the packages above and try again' ; echo '' ; echo press any key to close ; read whiteln"

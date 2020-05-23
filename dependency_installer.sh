#!/bin/bash

echo 'Installing required packages...'
echo ''

# Check distro
distro=$(uname -a)

# check install command based on distro
if [[ $distro == *Ubuntu* || $distro == *ubuntu* ]]; then
    update_cmd="sudo apt update -y"
    install_cmd="sudo apt install $* -y"
elif [[ $distro == *archlinux* ]]; then
    update_cmd="sudo pacman -Sy --noconfirm"
    install_cmd="sudo pacman -S $* --noconfirm"
else
    echo 'your linux distro is not supported by this script yet, please, install the following dependencies manualy and try again:'
    echo ''
    echo $*
    echo ''
    echo 'press ENTER to exit'
    read enter
    exit
fi

echo "updating system..."
sudo $update_cmd

echo $install_cmd

sudo $install_cmd


echo ''
echo 'finished! press ENTER to continue, and then run "YadBomb" again'
read enter

# xterm -T YadBomb -e /bin/bash -c "echo $missing_packages && echo 'please, install the packages above and try again' ; echo '' ; echo press any key to close ; read whiteln"

#/usr/bin/env bash

set -e

if ! [ $(id -u) = 0 ]; then
    echo "This script must be run as root"
    exit 1
fi

apt-get update
apt-get install -y \
    autojump \
    vim

cp .vimrc ~/
cp .git* ~/
echo .bashrc >> ~/.bashrc

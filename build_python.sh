#!/usr/bin/env bash
set -o nounset

python_url=$1

echo "Installing dependencies"
sudo apt install -y build-essential checkinstall
sudo apt install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev openssl

echo "Getting sources to /tmp/python_source.tar.xz"
wget $python_url -O /tmp/python_source.tar.xz

echo "Unpacking sources to /tmp/python_source"
mkdir /tmp/python_source
tar -xvf /tmp/python_source.tar.xz -C /tmp/python_source --strip 1

echo "Configuring"
cd /tmp/python_source
./configure

echo "Building"
make -j4

echo "Installing"
sudo make altinstall

echo "Cleaning up"
sudo rm -rf /tmp/python_source
sudo rm -f /tmp/python_source.tar.xz


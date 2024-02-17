#!/bin/sh
sudo apt update
sudo apt install build-essential git make cmake ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen fzf -y


rm -rf /tmp/nvim_install
mkdir /tmp/nvim_install
cd /tmp/nvim_install

git clone --depth 1 https://github.com/neovim/neovim.git .

# Get new tags from remote
git fetch --tags

# Checkout latest tag
echo "checking out nightly tag"
git checkout tags/nightly

cmake -S cmake.deps -B .deps -G Ninja -D CMAKE_BUILD_TYPE=RelWithDebInfo
cmake --build .deps
cmake -B build -G Ninja -D CMAKE_BUILD_TYPE=RelWithDebInfo
cmake --build build
sudo cmake --install build --prefix /usr

echo "ALL DONE"
rm -rf /tmp/nvim_install

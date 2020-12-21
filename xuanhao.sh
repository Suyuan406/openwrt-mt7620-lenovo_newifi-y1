#!/bin/bash
#Date:2020-12-17
#Version:1.0 

sudo apt-get update

sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget curl swig rsync

git clone https://github.com/openwrt/openwrt

cp /home/xuanhao/defconfig /home/xuanhao/openwrt/defconfig

cd openwrt

sed -i '$a src-git lienol https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default

./scripts/feeds update -a && ./scripts/feeds install -a

cat defconfig >> .config

make defconfig

make -j8 download V=s

make -j V=s

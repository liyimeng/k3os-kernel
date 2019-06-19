#!/bin/bash
echo "Run this script on ubuntu:18.04"
export VERSION=4.15.0-52-generic
export KERNEL_TAG=Ubuntu-4.15.0-52.56
export FIRMWARE_TAG=Ubuntu-1.176
export ARCH=amd64
sudo sed -i "s/# deb-src/deb-src/g" /etc/apt/sources.list \
    && sudo apt-get update \
    && sudo apt-get install -y build-essential \
       git \
       kernel-wedge \
        libncurses-dev \
        fakeroot \
        cpio \
        bison \
        flex \
        ccache \
        vim \
        gnupg2 \
        locales \
        bc \
        kmod \
        libelf-dev \
        rsync \
        gawk  \
        libudev-dev \
        pciutils-dev \
        libssl-dev
sudo apt-get build-dep -y linux-image-${VERSION}

export KERNEL_CLONE_CMD="git clone --depth=1 --branch ${KERNEL_TAG} git://kernel.ubuntu.com/ubuntu/ubuntu-bionic.git"
export FIRMWARE_CLONE_CMD="git clone --depth=1 --branch ${FIRMWARE_TAG} git://kernel.ubuntu.com/ubuntu/linux-firmware.git"
set  -xe
cd scripts
./ci
cd -

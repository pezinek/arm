#!/bin/sh

mkdir $PWD/rootfs && \
#debootstrap jessie $PWD/rootfs http://httpredir.debian.org/debian && \
LC_ALL="C" debootstrap --variant=minbase jessie $PWD/rootfs http://httpredir.debian.org/debian && \
chroot $PWD/rootfs /bin/bash << __CHROOT_COMMANDS__

  dpkg --purge --force-remove-essential systemd systemd-sysv init e2fslibs e2fsprogs procps udev mount adduser libsystemd0 bsdutils && \
  rm -rf /var/cache/apt/* && \
  rm -rf /var/lib/apt/lists/*

__CHROOT_COMMANDS__

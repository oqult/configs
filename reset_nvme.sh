#!/usr/bin/env bash
DEV=nvme1n1
PCI=$(basename $(readlink -f /sys/block/$DEV/device/device))
sudo umount /dev/${DEV}* 2>/dev/null
echo 1 | sudo tee /sys/bus/pci/devices/$PCI/remove
sleep 2
echo 1 | sudo tee /sys/bus/pci/rescan
sudo mount -a
sleep 2
lsblk | grep nvme

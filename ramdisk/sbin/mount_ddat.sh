#!/system/bin/sh

mkdir /tmp/updater
mount -t vfat -o noatime,umask=000,iocharset=utf8 /dev/block/platform/soc.2/by-name/ddat /tmp/updater
if [ $? -ne 0 ]
then
  mkfs.vfat /dev/block/platform/soc.2/by-name/ddat
  mount -t vfat -o noatime,umask=000,iocharset=utf8 /dev/block/platform/soc.2/by-name/ddat /tmp/updater
fi

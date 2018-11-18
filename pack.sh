#/bin/bash

cd ramdisk

find . | cpio -o -H newc | gzip -9 > ../test.img-ramdisk-mod.gz

cd ..

../mkbootimg \
    --kernel test.img-zImage \
    --ramdisk test.img-ramdisk-mod.gz \
    --cmdline "$(cat test.img-cmdline)" \
    --board "" \
    --base $(cat test.img-base) \
    --pagesize $(cat test.img-pagesize) \
    --kernel_offset $(cat test.img-kerneloff) \
    --ramdisk_offset $(cat test.img-ramdiskoff) \
    --second_offset $(cat test.img-secondoff) \
    --tags_offset $(cat test.img-tagsoff) \
    --header_version $(cat test.img-headerversion) \
    --hash $(cat test.img-hash) \
    -o "../test-mod-$(date +'%y%m%d-%H%M%S').img"

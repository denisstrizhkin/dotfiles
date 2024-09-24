function mount_kindle
    mountpoint /mnt/kindle && doas umount /mnt/kindle
    doas mount -o uid=$(id -u),gid=$(id -g) \
        /dev/disk/by-id/usb-Kindle_Internal_Storage_G8S2DK03410604JU-0:0 \
        /mnt/kindle
end

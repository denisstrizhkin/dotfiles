function umount_kindle
    doas umount /mnt/kindle
    doas sync
end

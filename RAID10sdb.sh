mdadm --create /dev/md10 -l 10 -n 4 /dev/sdb1 /dev/sdb2 /dev/sdb3 /dev/sdb4

mkfs.ext4 /dev/md10

mkdir /mnt/raid10

mount /dev/md10 /mnt/raid10

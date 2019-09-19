# 查看所有磁盘及分区
fdisk -l

# 硬盘分区
fdisk /dev/磁盘名称

# linux分区格式化
mkfs.ext3 /dev/分区名

# directory挂载分区
mount /dev/分区名 /directory

# 查看数据卷
df -h

# 取消directory挂载分区
umount /dev/分区

# 检查文件分区
e2fsck -f /dev/分区名

# 变更文件系统大小
resize2fs /dev/分区名
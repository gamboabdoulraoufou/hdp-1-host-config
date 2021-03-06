
#!/bin/bash

lvcreate -L 200G -n lvhadoopvar   VolGroup01
mkfs -t ext4 /dev/VolGroup01/lvhadoopvar 
mkdir -p  /hadoop/var
mount /dev/VolGroup01/lvhadoopvar  /hadoop/var

lvcreate -L 200G -n lvhadoopwork   VolGroup01
mkfs -t ext4 /dev/VolGroup01/lvhadoopwork 
mkdir -p  /hadoop/work
mount /dev/VolGroup01/lvhadoopwork  /hadoop/work

lvcreate -L 100G -n lvhadoopusr   VolGroup01
mkfs -t ext4 /dev/VolGroup01/lvhadoopusr 
mkdir -p  /hadoop/usr
mount /dev/VolGroup01/lvhadoopusr  /hadoop/usr


if [ "$1" = "yes" ];
  then
    lvcreate -L 1500G -n lvhadoopdata   VolGroup01
    mkfs -t ext4 /dev/VolGroup01/lvhadoopdata
    mkdir -p  /hadoop/data/hdfs/01
    mount /dev/VolGroup01/lvhadoopdata  /hadoop/data/hdfs/01
fi


#!/bin/bash
datat=$HOME/mnt/DataT/MOUNTED.txt
data3=$HOME/mnt/Data3/MOUNTED.txt

if [ -f $datat ] && [ -f $data3 ]; then
    echo ""
else
    echo " "
fi
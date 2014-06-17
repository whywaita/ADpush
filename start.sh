#!/bin/sh

DATE=`date +%Y%m%d`
nowpoint=`pwd`

mkdir $DATE
ln -s $nowpoint/ADpush/last.sh $nowpoint/$DATE/

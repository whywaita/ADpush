#!/bin/sh

nowpoint=`pwd`
backpoint=`pwd | xargs dirname`


ln -s $nowpoint/start.sh $backpoint/start.sh

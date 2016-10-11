#!/bin/bash
# Copyright (c) 2016, BarryKui.
#
# bash profile configure
# Tsinghua University
# Modified at Aug 9 2016
#


#### User Code Region 1 ###
faDir=$1

# according to your computer
SEND_THREAD_NUM=60
###########################

tmp_fifofile="/tmp/$$.fifo"
mkfifo "$tmp_fifofile"
exec 6<>"$tmp_fifofile"
for ((i=0;i<$SEND_THREAD_NUM;i++));do
                 echo                                                                                    
done >&6


#### User Code Region 2 ###
for file in $faDir/*.fa
###########################
do
        read -u6
        {
                #### User Code Region 3 ###
                ps aux|grep  python
                ###########################
                sleep 1
                echo >&6
        } &


                pid=$!
                echo $pid

done

wait
exec 6>&-
exit 0

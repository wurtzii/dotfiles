#!/bin/bash
swaymsg resize grow $1 20px
if [ $? -ne 0 ]
then
case $1 in
'left')
direction=right
;;
'right')
direction=left
;;
'up')
direction=down
;;
'down')
direction=up
;;
esac
swaymsg resize shrink $direction 20px
fi 

#!/bin/sh -x

DATE_TIME=`date +"%Y%m%d-%H%M%S"`
FILE_NAME=${DATE_TIME}.png

adb shell screencap -p /sdcard/${FILE_NAME}
adb pull /sdcard/${FILE_NAME}
adb shell rm /sdcard/${FILE_NAME}
convert -resize x480 ${FILE_NAME} ${FILE_NAME}

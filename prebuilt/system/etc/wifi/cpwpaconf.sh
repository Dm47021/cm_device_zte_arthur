#!/system/bin/sh
FILE=/data/misc/wifi/wpa_supplicant.conf
 
if [ -f $FILE ];

then
	echo

else
/system/xbin/busybox cp /system/etc/wifi/wpa_supplicant.conf /data/misc/wifi/
/system/xbin/busybox chmod 777 /data/misc/wifi/wpa_supplicant.conf
/system/xbin/busybox chown wifi.wifi /data/misc/wifi/wpa_supplicant.conf
fi











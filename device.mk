$(call inherit-product, build/target/product/full.mk)

$(call inherit-product, build/target/product/languages_small.mk)
$(call inherit-product, vendor/cm/config/common.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
# modules
$(call inherit-product-if-exists, device/zte/arthur/wifi_modules/modules.mk)

$(call inherit-product-if-exists, vendor/zte/arthur/arthur-vendor.mk)

DEVICE_PACKAGE_OVERLAYS := device/zte/arthur/overlay
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PROPERTY_OVERRIDES+= dalvik.vm.execution-mode=int:jit \
	ro.telephony.call_ring.multiple=false \
	ro.telephony.call_ring.delay=5000 \
	dalvik.vm.dexopt-flags=m=y,u=n,v=a,o=v \
	debug.enabletr=true \
	persist.sys.use_dithering=0 \
	ro.com.google.locationfeatures=1 \
	mobiledata.interfaces = wlan0,rmnet0 \
        dev.dmm.dpd.trigger_delay=30 

PRODUCT_LOCALES += hdpi

#LLVM for RenderScript
LLVM_ROOT_PATH := external/llvm

# Graphics
PRODUCT_PACKAGES += \
        copybit.msm7x30 \
        gralloc.msm7x30 \
        hwcomposer.msm7x30 \
        libgenlock \
        libmemalloc \
        liboverlay \
        libQcomUI \
        libtilerenderer \
    

# OMX
PRODUCT_PACKAGES += \
        libmm-omxcore \
	libOmxAacEnc \
	libOmxAmrEnc \
	libOmxCore \
	libOmxEvrcEnc \
	libOmxQcelp13Enc \
	libOmxVdec \
	libOmxVenc \
	libOmxVidEnc \
        libstagefrighthw 

# Audio
PRODUCT_PACKAGES += \
        audio.a2dp.default \
        audio_policy.msm7x30 \
        audio.primary.msm7x30 \
        audio_policy.conf \
        libaudioutils \
        libtinyalsa


## Bluetooth
PRODUCT_PACKAGES += \
    hcitool \
    hci_qcomm_init \
    hciconfig 

# Camera
PRODUCT_PACKAGES += \
    camera.msm7x30 \
    libcamera 

# gps
PRODUCT_PACKAGES += \
        librpc \
        gps.arthur

# Power HAL
PRODUCT_PACKAGES += \
        power.msm7x30

# Sensors 
PRODUCT_PACKAGES += \
        sensors.arthur
 
# WiFi
PRODUCT_PACKAGES += \
    libwpa_client 
 
# WarpedParts App
PRODUCT_PACKAGES += \
        V9Parts

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
	LiveWallpapersPicker \
        librs_jni 

# Other       
PRODUCT_PACKAGES += \
	applypatch \
	ast-mm-vdec-omx-test \
	com.android.future.usb.accessory \
	libdivxdrmdecrypt \
	libinvensense_hal \
	liblasic \
	liblinenoise \
	libmllite \
	libmlplatform \
	libmmjpeg_interface \
	libOpenMAXAL \
	libOpenSLES \
	liboverlay \
	make_ext4fs \
	mm-vdec-omx-property-mgr \
	mm-venc-omx-test720p \
	setup_fs 

# for bugmailer
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += send_bug

PRODUCT_COPY_FILES += \
         system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
         system/extras/bugmailer/send_bug:system/bin/send_bug
endif

# Enable repeatable keys in CWM
PRODUCT_PROPERTY_OVERRIDES += \
        ro.cwm.enable_key_repeat=true

# Root
PRODUCT_COPY_FILES += \
    device/zte/arthur/root1/default.prop:/root/default.prop \
    device/zte/arthur/root1/init.rc:/root/init.rc \
    device/zte/arthur/root1/init.arthur.rc:/root/init.arthur.rc \
    device/zte/arthur/root1/initlogo.rle:/root/initlogo.rle \
    device/zte/arthur/root1/init.qcom.rc:/root/init.qcom.rc \
    device/zte/arthur/root1/init.qcom.sh:/root/init.qcom.sh \
    device/zte/arthur/root1/logo.bmp:/root/logo.bmp \
    device/zte/arthur/root1/ueventd.rc:/root/ueventd.rc \
    device/zte/arthur/root1/sbin/membank.sh:/root/sbin/membank.sh \
    device/zte/arthur/root1/sbin/rmt_storage:/root/sbin/rmt_storage \
    device/zte/arthur/root1/fstab.arthur:/root/fstab.arthur \
    device/zte/arthur/root1/sbin/usbconfig:/root/sbin/usbconfig

# Recovery
PRODUCT_COPY_FILES += \
	device/zte/arthur/recovery/root/init.rc:/recovery/root/init.rc \
	device/zte/arthur/recovery/root/ueventd.rc:/recovery/root/ueventd.rc \
	device/zte/arthur/root1/sbin/rmt_storage:/recovery/root/sbin/rmt_storage \
	device/zte/arthur/root1/sbin/usbconfig:/recovery/root/sbin/usbconfig

PRODUCT_COPY_FILES += \
        device/zte/arthur/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \
	device/zte/arthur/prebuilt/b08c/etc/firmware/wlan/cfg.dat:system/etc/firmware/wlan/cfg.dat \
	device/zte/arthur/prebuilt/b08c/etc/firmware/wlan/qcom_cfg.ini:system/etc/firmware/wlan/qcom_cfg.ini \
	device/zte/arthur/prebuilt/b08c/etc/firmware/wlan/qcom_fw.bin:system/etc/firmware/wlan/qcom_fw.bin \
	device/zte/arthur/prebuilt/b08c/etc/firmware/wlan/qcom_wapi_fw.bin:system/etc/firmware/wlan/qcom_wapi_fw.bin \
	device/zte/arthur/prebuilt/b08c/etc/firmware/wlan/qcom_wlan_nv.bin:system/etc/firmware/wlan/qcom_wlan_nv.bin \
	device/zte/arthur/prebuilt/files/etc/wifi/cpwpaconf.sh:system/etc/wifi/cpwpaconf.sh

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
	device/zte/arthur/prebuilt/files/etc/permissions/com.google.android.media.effects.xml:/system/etc/permissions/com.google.android.media.effects.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml

# Adreno Firmwares
PRODUCT_COPY_FILES += \
    device/zte/arthur/prebuilt/files/etc/firmware/a225_pfp.fw:system/etc/firmware/a225_pfp.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/a225_pm4.fw:system/etc/firmware/a225_pm4.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/a225p5_pm4.fw:system/etc/firmware/a225p5_pm4.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/a300_pfp.fw:system/etc/firmware/a300_pfp.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/a300_pm4.fw:system/etc/firmware/a300_pm4.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/dsps_fluid.b00:system/etc/firmware/dsps_fluid.b00 \
    device/zte/arthur/prebuilt/files/etc/firmware/dsps_fluid.b01:system/etc/firmware/dsps_fluid.b01 \
    device/zte/arthur/prebuilt/files/etc/firmware/dsps_fluid.b02:system/etc/firmware/dsps_fluid.b02 \
    device/zte/arthur/prebuilt/files/etc/firmware/dsps_fluid.b03:system/etc/firmware/dsps_fluid.b03 \
    device/zte/arthur/prebuilt/files/etc/firmware/dsps_fluid.mdt:system/etc/firmware/dsps_fluid.mdt \
    device/zte/arthur/prebuilt/files/etc/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/vidc_1080p.fw:system/etc/firmware/vidc_1080p.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    device/zte/arthur/prebuilt/files/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
    device/zte/arthur/prebuilt/files/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
    device/zte/arthur/prebuilt/files/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/zte/arthur/prebuilt/files/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \
    device/zte/arthur/prebuilt/files/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/zte/arthur/prebuilt/files/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/zte/arthur/prebuilt/files/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    device/zte/arthur/prebuilt/files/lib/libC2D2.so:system/lib/libC2D2.so \
    device/zte/arthur/prebuilt/files/lib/libgsl.so:system/lib/libgsl.so \
    device/zte/arthur/prebuilt/files/lib/libOpenVG.so:system/lib/libOpenVG.so \
    device/zte/arthur/prebuilt/files/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so \
    device/zte/arthur/prebuilt/b08c/lib/libaudioalsa.so:obj/lib/libaudioalsa.so \
    device/zte/arthur/prebuilt/b08c/lib/libaudioalsa.so:system/lib/libaudioalsa.so \
    device/zte/arthur/prebuilt/files/lib/liboncrpc.so:system/lib/liboncrpc.so \
    device/zte/arthur/prebuilt/files/lib/liboncrpc.so:obj/lib/liboncrpc.so \
    device/zte/arthur/prebuilt/files/lib/libnv.so:system/lib/libnv.so \
    device/zte/arthur/prebuilt/files/lib/libnv.so:obj/lib/libnv.so

# Legacy Touch Screen
PRODUCT_COPY_FILES += \
	device/zte/arthur/prebuilt/files/usr/idc/synaptics-rmi4-ts.idc:system/usr/idc/synaptics-rmi4-ts.idc

PRODUCT_COPY_FILES += \
	device/zte/arthur/prebuilt/b08c/lib/libgemini.so:system/lib/libgemini.so \
	device/zte/arthur/prebuilt/b08c/lib/libmmipl.so:system/lib/libmmipl.so \
	device/zte/arthur/prebuilt/b08c/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
	device/zte/arthur/prebuilt/b08c/lib/libmmjpeg.so:obj/lib/libmmjpeg.so \
	device/zte/arthur/prebuilt/b08c/lib/libcamera.so:system/lib/libcamera.so \
	device/zte/arthur/prebuilt/b08c/lib/libcamera.so:obj/lib/libcamera.so \
	device/zte/arthur/prebuilt/b08c/lib/liboemcamera.so:system/lib/liboemcamera.so \
	device/zte/arthur/prebuilt/b08c/lib/liboemcamera.so:obj/lib/liboemcamera.so \

# B08c usr/Keychars/Keylayout 
PRODUCT_COPY_FILES += \
    device/zte/arthur/prebuilt/b08c/usr/icu/icudt44l.dat:system/usr/icu/icudt44l.dat \
    device/zte/arthur/prebuilt/b08c/usr/keychars/arthur_keypad_numeric.kcm.bin:system/usr/keychars/arthur_keypad_numeric.kcm.bin \
    device/zte/arthur/prebuilt/b08c/usr/keychars/arthur_keypad_qwerty.kcm.bin:system/usr/keychars/arthur_keypad_qwerty.kcm.bin \
    device/zte/arthur/prebuilt/b08c/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/zte/arthur/prebuilt/b08c/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/zte/arthur/prebuilt/b08c/usr/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/zte/arthur/prebuilt/b08c/usr/keylayout/arthur_keypad.kl:system/usr/keylayout/arthur_keypad.kl \
    device/zte/arthur/prebuilt/b08c/usr/keylayout/fluid-keypad.kl:system/usr/keylayout/fluid-keypad.kl \
    device/zte/arthur/prebuilt/b08c/usr/keylayout/msm_tma300_ts.kl:system/usr/keylayout/msm_tma300_ts.kl

# B06 RIL
PRODUCT_COPY_FILES += \
	device/zte/arthur/prebuilt/b06ril/bin/netmgrd:system/bin/netmgrd \
	device/zte/arthur/prebuilt/b06ril/bin/qmuxd:system/bin/qmuxd \
	device/zte/arthur/prebuilt/b06ril/bin/rild:obj/bin/rild \
	device/zte/arthur/prebuilt/b06ril/bin/rild:system/bin/rild \
	device/zte/arthur/prebuilt/b06ril/lib/libauth.so:system/lib/libauth.so \
	device/zte/arthur/prebuilt/b06ril/lib/libcm.so:system/lib/libcm.so \
	device/zte/arthur/prebuilt/b06ril/lib/libcommondefs.so:obj/lib/libcommondefs.so \
	device/zte/arthur/prebuilt/b06ril/lib/libcommondefs.so:system/lib/libcommondefs.so \
	device/zte/arthur/prebuilt/b06ril/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
	device/zte/arthur/prebuilt/b06ril/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
	device/zte/arthur/prebuilt/b06ril/lib/libgps.so:system/lib/libgps.so \
	device/zte/arthur/prebuilt/b06ril/lib/libdiag.so:obj/lib/libdiag.so \
	device/zte/arthur/prebuilt/b06ril/lib/libdiag.so:system/lib/libdiag.so \
	device/zte/arthur/prebuilt/b06ril/lib/libdl.so:system/lib/libdl.so \
	device/zte/arthur/prebuilt/b06ril/lib/libdsi_netctrl.so:system/lib/libdsi_netctrl.so \
	device/zte/arthur/prebuilt/b06ril/lib/libdsm.so:system/lib/libdsm.so \
	device/zte/arthur/prebuilt/b06ril/lib/libdsprofile.so:system/lib/libdsprofile.so \
	device/zte/arthur/prebuilt/b06ril/lib/libdss.so:system/lib/libdss.so \
	device/zte/arthur/prebuilt/b06ril/lib/libdssock.so:system/lib/libdssock.so \
	device/zte/arthur/prebuilt/b06ril/lib/libdsutils.so:system/lib/libdsutils.so \
	device/zte/arthur/prebuilt/b06ril/lib/libidl.so:system/lib/libidl.so \
	device/zte/arthur/prebuilt/b06ril/lib/libnetmgr.so:system/lib/libnetmgr.so \
	device/zte/arthur/prebuilt/b06ril/lib/libnv.so:system/lib/libnv.so \
	device/zte/arthur/prebuilt/b06ril/lib/libping_mdm.so:system/lib/libping_mdm.so \
	device/zte/arthur/prebuilt/b06ril/lib/libqdp.so:system/lib/libqdp.so \
	device/zte/arthur/prebuilt/b06ril/lib/libqmi.so:system/lib/libqmi.so \
	device/zte/arthur/prebuilt/b06ril/lib/liboncrpc.so:system/lib/liboncrpc.so \
	device/zte/arthur/prebuilt/b06ril/lib/libqmiservices.so:system/lib/libqmiservices.so \
	device/zte/arthur/prebuilt/b06ril/lib/libqueue.so:system/lib/libqueue.so \
	device/zte/arthur/prebuilt/b06ril/lib/libloc_api-rpc-qc.so:system/lib/libloc_api-rpc-qc.so \
	device/zte/arthur/prebuilt/b06ril/lib/libloc_ext.so:system/lib/libloc_ext.so \
	device/zte/arthur/prebuilt/b06ril/lib/libloc-rpc.so:system/lib/libloc-rpc.so \
	device/zte/arthur/prebuilt/b06ril/lib/librefcne.so:system/lib/librefcne.so \
	device/zte/arthur/prebuilt/b06ril/lib/libreference-cdma-sms.so:system/lib/libreference-cdma-sms.so \
        device/zte/arthur/prebuilt/b06ril/lib/libril.so:system/lib/libril.so \
        device/zte/arthur/prebuilt/b06ril/lib/libril.so:obj/lib/libril.so \
	device/zte/arthur/prebuilt/b06ril/lib/libreference-ril.so:obj/lib/libreference-ril.so \
	device/zte/arthur/prebuilt/b06ril/lib/libreference-ril.so:system/lib/libreference-ril.so \
	device/zte/arthur/prebuilt/b06ril/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
	device/zte/arthur/prebuilt/b06ril/lib/libril-qc-qmi-1.so:system/lib/libril-qc-qmi-1.so \
	device/zte/arthur/prebuilt/b06ril/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
	device/zte/arthur/prebuilt/b06ril/lib/libuim.so:system/lib/libuim.so \
	device/zte/arthur/prebuilt/b06ril/lib/libwms.so:system/lib/libwms.so \
	device/zte/arthur/prebuilt/b06ril/lib/libwmsts.so:system/lib/libwmsts.so \
	device/zte/arthur/prebuilt/b06ril/lib/hw/gps.default.so:system/lib/hw/gps.msm7x30.so \
	device/zte/arthur/prebuilt/b06ril/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
	device/zte/arthur/prebuilt/b06ril/lib/libpbmlib.so:system/lib/libpbmlib.so \
	device/zte/arthur/prebuilt/b06ril/lib/liboem_rapi.so:system/lib/liboem_rapi.so \
	device/zte/arthur/prebuilt/b06ril/lib/libpdsm_atl.so:system/lib/libpdsm_atl.so \
	device/zte/arthur/prebuilt/b06ril/lib/libpdapi.so:system/lib/libpdapi.so \
	device/zte/arthur/prebuilt/files/lib/libqc-opt.so:system/lib/libqc-opt.so

# Audio fix
PRODUCT_COPY_FILES += \
        device/zte/arthur/prebuilt/b08c/etc/audio_policy.conf:system/etc/audio_policy.conf 

# Wireless AP
PRODUCT_PACKAGES += \
	hostapd_cli \
	hostapd

# hostapd
PRODUCT_COPY_FILES += \
	device/zte/arthur/prebuilt/b08c/hostapd/hostapd.accept:system/hostapd/hostapd.accept \
	device/zte/arthur/prebuilt/b08c/hostapd/hostapd.conf:system/hostapd/hostapd.conf \
	device/zte/arthur/prebuilt/b08c/hostapd/hostapd.deny:system/hostapd/hostapd.deny \
	device/zte/arthur/prebuilt/b08c/qcom/softap/hostapd_default.conf:system/etc/firmware/wlan/hostapd_default.conf \
	device/zte/arthur/prebuilt/b08c/lib/libQWiFiSoftApCfg.so:system/lib/libQWiFiSoftApCfg.so

# B08c bin
PRODUCT_COPY_FILES += \
        device/zte/arthur/prebuilt/b08c/bin/akmd2:system/bin/akmd2 \
        device/zte/arthur/prebuilt/b08c/bin/akmd8962:system/bin/akmd8962 \
	device/zte/arthur/prebuilt/b08c/bin/at-daemon:system/bin/at-daemon \
	device/zte/arthur/prebuilt/b08c/bin/battery_charging:system/bin/battery_charging \
	device/zte/arthur/prebuilt/b08c/bin/bluetoothd:system/bin/bluetoothd \
	device/zte/arthur/prebuilt/b08c/bin/bt_testmode.sh:system/bin/bt_testmode.sh \
	device/zte/arthur/prebuilt/b08c/bin/btwlancoex:system/bin/btwlancoex \
	device/zte/arthur/prebuilt/b08c/bin/CKPD-daemon:system/bin/CKPD-daemon \
	device/zte/arthur/prebuilt/b08c/bin/DrmHost:system/bin/DrmHost \
	device/zte/arthur/prebuilt/b08c/bin/ds_fmc_appd:system/bin/ds_fmc_appd \
	device/zte/arthur/prebuilt/b08c/bin/fm_qsoc_patches:system/bin/fm_qsoc_patches \
	device/zte/arthur/prebuilt/b08c/bin/getlogtofile:system/bin/getlogtofile \
	device/zte/arthur/prebuilt/b08c/bin/hci_qcomm_init:system/bin/hci_qcomm_init \
	device/zte/arthur/prebuilt/b08c/bin/hlr_auc_gw:system/bin/hlr_auc_gw \
        device/zte/arthur/prebuilt/b08c/bin/hostapd:system/bin/hostapd \
        device/zte/arthur/prebuilt/b08c/bin/hostapd_cli:system/bin/hostapd_cli \
	device/zte/arthur/prebuilt/b08c/bin/init.btprop.sh:system/bin/init.btprop.sh \
        device/zte/arthur/prebuilt/b08c/bin/iprenew:system/bin/iprenew \
	device/zte/arthur/prebuilt/b08c/bin/loc_api_app:system/bin/loc_api_app \
	device/zte/arthur/prebuilt/b08c/bin/port-bridge:system/bin/port-bridge \
	device/zte/arthur/prebuilt/b08c/bin/proximity.init:system/bin/proximity.init \
	device/zte/arthur/prebuilt/b08c/bin/rmt_storage:system/bin/rmt_storage \
	device/zte/arthur/prebuilt/b08c/bin/sdcard:system/bin/sdcard \
	device/zte/arthur/prebuilt/b08c/bin/sprintdiag:system/bin/sprintdiag \
	device/zte/arthur/prebuilt/b08c/bin/thermald:system/bin/thermald \
	device/zte/arthur/prebuilt/b08c/bin/usbhub:system/bin/usbhub \
	device/zte/arthur/prebuilt/b08c/bin/usbhub_init:system/bin/usbhub_init \
        device/zte/arthur/prebuilt/b08c/bin/akmd8962:system/bin/akmd8962

# B08c etc
PRODUCT_COPY_FILES += \
        device/zte/arthur/prebuilt/b08c/etc/media_codecs.xml:system/etc/media_codecs.xml \
        device/zte/arthur/prebuilt/b08c/etc/media_profiles.xml:system/etc/media_profiles.xml \
	device/zte/arthur/prebuilt/b08c/etc/thermald.conf:system/etc/thermald.conf \
	device/zte/arthur/prebuilt/b08c/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
	device/zte/arthur/prebuilt/b08c/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
        device/zte/arthur/prebuilt/b08c/etc/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh \
	device/zte/arthur/prebuilt/b08c/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
	device/zte/arthur/prebuilt/b08c/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
	device/zte/arthur/prebuilt/b08c/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
	device/zte/arthur/prebuilt/b08c/etc/vold.fstab:system/etc/vold.fstab \
        device/zte/arthur/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \

# B08c lib
PRODUCT_COPY_FILES += \
	device/zte/arthur/prebuilt/b08c/lib/libmmosal.so:system/lib/libmmosal.so \
	device/zte/arthur/prebuilt/b08c/lib/libmmparser.so:system/lib/libmmparser.so \
	device/zte/arthur/prebuilt/b08c/lib/libmmparser_divxdrmlib.so:system/lib/libmmparser_divxdrmlib.so \
        device/zte/arthur/prebuilt/b08c/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
	device/zte/arthur/prebuilt/b08c/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
	device/zte/arthur/prebuilt/b08c/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
	device/zte/arthur/prebuilt/b08c/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
	device/zte/arthur/prebuilt/b08c/lib/libOmxQcelp13Dec.so:system/lib/libOmxQcelp13Dec.so \
	device/zte/arthur/prebuilt/b08c/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
	device/zte/arthur/prebuilt/b08c/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
        device/zte/arthur/prebuilt/files/lib/hw/lights.msm7x30.so:system/lib/hw/lights.msm7x30.so \

# Bluez
PRODUCT_COPY_FILES += \
    system/bluetooth/data/audio.conf:system/etc/bluetooth/audio.conf \
    system/bluetooth/data/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
    system/bluetooth/data/blacklist.conf:system/etc/bluetooth/blacklist.conf \
    system/bluetooth/data/input.conf:system/etc/bluetooth/input.conf \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf \
    system/bluetooth/data/network.conf:system/etc/bluetooth/network.conf


# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
  qcom.bt.dev_power_class=2 \
  ro.qualcomm.bluetooth.dun=true \
  ro.bluetooth.remote.autoconnect=true \
  ro.qualcomm.bluetooth.ftp=true \
  ro.bluetooth.request.master=true

# Fix for apollo
PRODUCT_PROPERTY_OVERRIDES += \
  lpa.decode=false \
  tunnel.decode=true \
  lpa.use-stagefright=true


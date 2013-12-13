
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_small.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

DEVICE_PACKAGE_OVERLAYS := device/zte/arthur/overlay

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_TAGS += dalvik.gc.type-precise

# Graphics
PRODUCT_PACKAGES += \
        copybit.msm7x30 \
        gralloc.msm7x30 \
        hwcomposer.msm7x30 \
        libgenlock \
        libmemalloc \
        liboverlay \
        libQcomUI \
        libtilerenderer 
    
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

# Wireless AP
PRODUCT_PACKAGES += \
	hostapd_cli \
	hostapd
 
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

# Enable repeatable keys in CWM
PRODUCT_PROPERTY_OVERRIDES += \
        ro.cwm.enable_key_repeat=true

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/zte/arthur/ramdisk,root)

#obj 
PRODUCT_COPY_FILES += \
	device/zte/arthur/prebuilt/system/lib/libaudioalsa.so:obj/lib/libaudioalsa.so \
        device/zte/arthur/prebuilt/system/lib/liboncrpc.so:obj/lib/liboncrpc.so \
        device/zte/arthur/prebuilt/system/lib/libnv.so:obj/lib/libnv.so \
        device/zte/arthur/prebuilt/system/lib/libril.so:obj/lib/libril.so \
        device/zte/arthur/prebuilt/system/lib/liboemcamera.so:obj/lib/liboemcamera.so \
        device/zte/arthur/prebuilt/system/lib/libcamera.so:obj/lib/libcamera.so \

# Recovery
PRODUCT_COPY_FILES += \
	device/zte/arthur/recovery/root/init.rc:/recovery/root/init.rc \
	device/zte/arthur/recovery/root/ueventd.rc:/recovery/root/ueventd.rc \
	device/zte/arthur/ramdisk/sbin/rmt_storage:/recovery/root/sbin/rmt_storage \
	device/zte/arthur/ramdisk/sbin/usbconfig:/recovery/root/sbin/usbconfig


# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/zte/arthur/prebuilt/system,system)
	

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
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml

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

PRODUCT_PROPERTY_OVERRIDES += \
  dalvik.vm.execution-mode=int:jit \
  ro.telephony.call_ring.multiple=false \
  ro.telephony.call_ring.delay=5000 \
  dalvik.vm.dexopt-flags=m=y,u=n,v=a,o=v \
  debug.enabletr=true \
  persist.sys.use_dithering=0 \
  ro.com.google.locationfeatures=1 \
  mobiledata.interfaces = wlan0,rmnet0 \
  ro.dev.dmm=1 \
  dev.dmm.dpd.trigger_delay=30 

# OpenGL
PRODUCT_PROPERTY_OVERRIDES += \
  ro.opengles.version=131072 \
  ro.opengles.surface.rgb565=true

# Silk UI, By DM47021
PRODUCT_PROPERTY_OVERRIDES += \
  debug.sf.hw = 1 \
  debug.enabletr = true \
  debug.qctwa.preservebuf = 1 \
  debug.egl.profiler=1 \
  debug.gr.swapinterval=1 \
  persist.sampling_profiler=0 \
  persist.sys.NV_FPSLIMIT=60 \
  persist.sys.ui.hw=1 \
  persist.sys.use_16bpp_alpha=1 \
  persist.sys.use_dithering=1 \
  persist.service.lgospd.enable=0 \
  persist.service.pcsync.enable=0 


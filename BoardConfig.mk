# Copyright (C) 2012 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# NOTE: All Modifications Should Be Outlined As WHO,DATE,VER,WHAT START / END e.g DM061513JB Wifi ---- Start 

LOCAL_PATH := $(call my-dir)

TARGET_SPECIFIC_HEADER_PATH := device/zte/arthur/include

# Camera
BOARD_NEEDS_MEMORYHEAPPMEM := true
BOARD_VENDOR := ZTE
USE_CAMERA_STUB := false
TARGET_DISABLE_ARM_PIE := true
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT
BUILD_LIBCAMERA := true

#Board Settings
TARGET_BOARD_PLATFORM := msm7x30
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_BOOTLOADER_BOARD_NAME := arthur
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_ARMV7A_BUG := true
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp -march=armv7-a
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp -march=armv7-a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_BOARD_PLATFORM_FPU := neon
BOARD_USES_ADRENO_200 := true

TARGET_PROVIDES_INIT_RC := true
TARGET_PROVIDES_RECOVERY_INIT_RC := true
TARGET_RECOVERY_INITRC := device/zte/arthur/recovery/root/init.rc
ARCH_ARM_HAVE_ARMV7A := true
# We Dont Build These
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_NO_INITLOGO := true

#Browser
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true
DYNAMIC_SHARED_LIBV8SO := false
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8

# Audio
TARGET_PROVIDES_LIBAUDIO := true
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_QCOM_AUDIO_V2 := true  
BOARD_USES_QCOM_AUDIO_RESETALL := true
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BLUEZ := true
BOARD_HAVE_BLUETOOTH_BCM := true 

# FM Radio
BOARD_HAVE_QCOM_FM := true
COMMON_GLOBAL_CFLAGS += -DQCOM_FM_ENABLED

#Graphics
BOARD_EGL_CFG := device/zte/arthur/prebuilt/files/lib/egl/egl.cfg
COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_EXTERNAL_IMAGE -DMISSING_EGL_PIXEL_FORMAT_YV12 -DMISSING_GRALLOC_BUFFERS -DEGL_ALWAYS_ASYNC
USE_OPENGL_RENDERER := true
TARGET_NO_HW_VSYNC := true
TARGET_HAVE_BYPASS := false
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_OVERLAY := true
TARGET_USES_SF_BYPASS := false
TARGET_USE_SCORP_BIONIC_OPTIMIZATION := true
TARGET_USE_SCORPION_PLD_SET := true
# Set to 9 for 8650A
TARGET_SCORPION_BIONIC_PLDOFFS := 6
TARGET_SCORPION_BIONIC_PLDSIZE := 128
BOARD_USE_QCOM_PMEM := true
TARGET_HARDWARE_3D := true
TARGET_GRALLOC_USES_ASHMEM := true
TARGET_USES_ION := false
TARGET_USES_HWCOMPOSER := true
BOARD_USES_GENLOCK := true
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
COMMON_GLOBAL_CFLAGS += -DFORCE_CPU_UPLOAD -DQCOM_NO_SECURE_PLAYBACK -DUSES_LEGACY_EGL 
COMMON_GLOBAL_CFLAGS += -DQCOM_ACDB_ENABLED -DLEGACY_QCOM_VOICE -DPOLL_CALL_STATE -DUSE_QMI
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_USE_SKIA_LCDTEXT := true
TARGET_QCOM_HDMI_OUT := false
ENABLE_WTF_USE_ACCELERATED_COMPOSITING := true
WEBCORE_INPAGE_VIDEO := true
TARGET_HAVE_TSLIB := true
#Legacy Graphics 
COMMON_GLOBAL_CFLAGS += -DUSES_LEGACY_GRAPHICS
BOARD_USES_LEGACY_GRAPHICS := true

# Legacy touchscreen support
BOARD_USE_LEGACY_TOUCHSCREEN := true

# Qcom
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_GPS := true
BOARD_USES_QCOM_LIBS := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
BOARD_USES_QCOM_LIBRPC := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_ICS_COMPAT -DICS_CAMERA_BLOB -DQCOM_ROTATOR_KERNEL_FORMATS # <<DM061513JB Rotator
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default

# Ril
BOARD_USES_LEGACY_RIL := true

# Stagefright
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DREFRESH_RATE=60 -DQCOM_LEGACY_OMX 

# Wifi
# Defines for external/wpa_supplicant_*
BOARD_WLAN_DEVICE := qcwcn
BOARD_HAS_QCOM_WLAN := true
WPA_SUPPLICANT_VERSION       := VER_0_6_X
BOARD_WPA_SUPPLICANT_DRIVER  := WEXT
BOARD_WLAN_DEVICE            := libra

# Defines for hardware/libhardware_legacy/wifi
WIFI_DRIVER_MODULE_PATH      := "/system/lib/modules/libra.ko"
WIFI_DRIVER_MODULE_NAME      := "libra"
WIFI_EXT_MODULE_PATH         := "/system/lib/modules/librasdioif.ko"
WIFI_EXT_MODULE_NAME         := "librasdioif"
BOARD_WEXT_NO_COMBO_SCAN := true
WPA_BUILD_SUPPLICANT := true


# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true

# Inline Kernel Build
#TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3
TARGET_KERNEL_CONFIG := arthur_dm_defconfig
# Kernel
TARGET_PREBUILT_KERNEL := device/zte/arthur/zImage
TARGET_PREBUILT_RECOVERY_KERNEL := device/zte/arthur/recovery/recovery_kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM1,115200 androidboot.hardware=arthur
BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096

# Partition Info
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 524288000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2908749824
BOARD_FLASH_BLOCK_SIZE := 262144
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_HAS_NO_SELECT_BUTTON := true
# Use this flag if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true


# SD Card
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_USES_MMCUTILS := true

# Insecure boot
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += persist.service.adb.enable=1

# USB "WORKING" DO NOT FUCK WITH THIS!!
BOARD_VOLD_MAX_PARTITIONS := 24
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_CUSTOM_USB_CONTROLLER := ../../device/zte/arthur/UsbController.cpp
BOARD_UMS_LUNFILE := /sys/devices/platform/msm_hsusb/gadget/lun0/file
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file

# TWRP RECOVERY
TARGET_RECOVERY_GUI := true
DEVICE_RESOLUTION := 480x800
#TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_HAS_FLIPPED_SCREEN := true

TARGET_OTA_ASSERT_DEVICE := arthur,warp
TARGET_RECOVERY_INITRC := device/zte/arthur/recovery/root/init.rc
BOARD_CUSTOM_GRAPHICS := ../../../device/zte/arthur/recovery/graphics.c
BOARD_CUSTOM_RECOVERY_KEYMAPPING:= ../../device/zte/arthur/recovery/recovery_ui.c
TARGET_RECOVERY_PRE_COMMAND := "echo 3 > /proc/sys/vm/drop_caches; sync"

# Releasetools
TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/zte/arthur/releasetools/arthur_ota_from_target_files

# Create Odex Files
WITH_DEXPREOPT := true

# props
ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mass_storage,adb

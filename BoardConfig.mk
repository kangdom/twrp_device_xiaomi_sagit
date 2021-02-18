#
# Copyright 2017 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a73

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8998
TARGET_NO_BOOTLOADER := true

# Kernel
TARGET_KERNEL_CONFIG := sagit_defconfig
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_SOURCE := kernel/xiaomi/msm8998

BOARD_KERNEL_CMDLINE := androidboot.console=ttyMSM0 androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += service_locator.enable=1
BOARD_KERNEL_CMDLINE += swiotlb=2048
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=a800000.dwc3
BOARD_KERNEL_CMDLINE += androidboot.configfs=true
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

export CROSS_COMPILE_ARM32="arm-linux-androideabi-"

# Platform
TARGET_BOARD_PLATFORM := msm8998
TARGET_BOARD_PLATFORM_GPU := qcom-adreno540

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5368709120
BOARD_USERDATAIMAGE_PARTITION_SIZE := 120426835968
BOARD_VENDORIMAGE_PARTITION_SIZE := 872415232
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_COPY_OUT_VENDOR := vendor
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# System-as-root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# TWRP specific build flags
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_DEFAULT_BRIGHTNESS := 2047
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_TWRPAPP := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_CRYPTO := true
#TW_INCLUDE_NTFS_3G := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_MAX_BRIGHTNESS := 4095
TW_SCREEN_BLANK_ON_BOOT := true
TW_THEME := portrait_hdpi
TW_USE_TOOLBOX := true

# Haters gonna hate..
ALLOW_MISSING_DEPENDENCIES := true

# SHRP flags
SHRP_PATH := device/xiaomi/sagit
SHRP_MAINTAINER := wannacry
SHRP_DEVICE_CODE := sagit
SHRP_INTERNAL := /sdcard
SHRP_REC := /dev/block/bootdevice/by-name/recovery
SHRP_OTG := /usb_otg
SHRP_FLASH := 1
SHRP_FLASH_MAX_BRIGHTNESS := 200
SHRP_EDL_MODE := 1
SHRP_REC_TYPE := Universal
SHRP_DARK := true
SHRP_EXPRESS := true

# SHRP addons
SHRP_EXTERNAL_ADDON_PATH := device/xiaomi/sagit/addons/
INC_IN_REC_MAGISK := true

SHRP_EXTERNAL_ADDON_1_NAME := "Camera module"
SHRP_EXTERNAL_ADDON_1_INFO := "A magisk module by Alexey070315"
SHRP_EXTERNAL_ADDON_1_FILENAME := "60fps_miuiPIE_stable_v6_reload.zip"
SHRP_EXTERNAL_ADDON_1_BTN_TEXT := "Install"
SHRP_EXTERNAL_ADDON_1_SUCCESSFUL_TEXT := "Installed"
SHRP_INC_IN_REC_EXTERNAL_ADDON_1 := true

SHRP_EXTERNAL_ADDON_2_NAME := "Camera module sepolicy"
SHRP_EXTERNAL_ADDON_2_INFO := "A magisk module which allows you keep selinux enforcing and use camera module"
SHRP_EXTERNAL_ADDON_2_FILENAME := "Gcam Sepolicy.zip"
SHRP_EXTERNAL_ADDON_2_BTN_TEXT := "Install"
SHRP_EXTERNAL_ADDON_2_SUCCESSFUL_TEXT := "Installed"
SHRP_INC_IN_REC_EXTERNAL_ADDON_2 := true

SHRP_EXTERNAL_ADDON_3_NAME := "AOSP apps uninstaller"
SHRP_EXTERNAL_ADDON_3_INFO := "Get rid of prebuilt AOSP apps"
SHRP_EXTERNAL_ADDON_3_FILENAME := "AOSP_uninstaller_v1.1.zip"
SHRP_EXTERNAL_ADDON_3_BTN_TEXT := "Uninstall"
SHRP_EXTERNAL_ADDON_3_SUCCESSFUL_TEXT := "Uninstalled"
SHRP_INC_IN_REC_EXTERNAL_ADDON_3 := true

SHRP_EXTERNAL_ADDON_4_NAME := "Gcam uninstaller"
SHRP_EXTERNAL_ADDON_4_INFO := "Native Google Camera Uninstaller"
SHRP_EXTERNAL_ADDON_4_FILENAME := "[AOSP]GCam-Uninstaller_200321.zip"
SHRP_EXTERNAL_ADDON_4_BTN_TEXT := "Uninstall"
SHRP_EXTERNAL_ADDON_4_SUCCESSFUL_TEXT := "Uninstalled"
SHRP_INC_IN_REC_EXTERNAL_ADDON_4 := true

SHRP_EXTERNAL_ADDON_5_NAME := "AOSP f2fs patcher"
SHRP_EXTERNAL_ADDON_5_INFO := "Allows you to use f2fs in every AOSP rom"
SHRP_EXTERNAL_ADDON_5_FILENAME := "FSTAB-AOSP_Q-EXT4&F2FS-unencrypted-SAGIT.zip"
SHRP_EXTERNAL_ADDON_5_BTN_TEXT := "Patch"
SHRP_EXTERNAL_ADDON_5_SUCCESSFUL_TEXT := "Patched"
SHRP_INC_IN_REC_EXTERNAL_ADDON_5 := true

SHRP_EXTERNAL_ADDON_6_NAME := "MIUI f2fs patcher"
SHRP_EXTERNAL_ADDON_6_INFO := "Allows you to use f2fs in every MIUI rom"
SHRP_EXTERNAL_ADDON_6_FILENAME := "FSTAB-MIUI-PIE-EXT4&F2FS-unencrypted-SAGIT.zip"
SHRP_EXTERNAL_ADDON_6_BTN_TEXT := "Patch"
SHRP_EXTERNAL_ADDON_6_SUCCESSFUL_TEXT := "Patched"
SHRP_INC_IN_REC_EXTERNAL_ADDON_6 := true

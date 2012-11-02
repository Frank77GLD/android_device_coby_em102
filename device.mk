# Copyright (C) 2012 The Android Open Source Project
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

DEVICE_PACKAGE_OVERLAYS := device/coby/em102/overlay

# make fallback to ldpi possible
PRODUCT_AAPT_CONFIG := normal mdpi ldpi
PRODUCT_AAPT_PREF_CONFIG := mdpi ldpi

PRODUCT_COPY_FILES := \
	device/coby/em102/init.em102.rc:root/init.em102.rc \
	device/coby/em102/init.em102.usb.rc:root/init.em102.usb.rc \
	device/coby/em102/ueventd.em102.rc:root/ueventd.em102.rc \
	device/coby/em102/fstab.em102:root/fstab.em102

# init modules
PRODUCT_COPY_FILES += \
	device/coby/em102/prebuilt/modules/init/tcc_mtd.ko:root/lib/modules/tcc_mtd.ko \
	device/coby/em102/prebuilt/modules/init/tcc_nand.ko:root/lib/modules/tcc_nand.ko \
	device/coby/em102/prebuilt/modules/init/ext4.ko:root/lib/modules/ext4.ko \
	device/coby/em102/prebuilt/modules/init/jbd2.ko:root/lib/modules/jbd2.ko \
	device/coby/em102/prebuilt/modules/init/mali.ko:root/lib/modules/mali.ko \
	device/coby/em102/prebuilt/modules/init/ump.ko:root/lib/modules/ump.ko

# regular modules
PRODUCT_COPY_FILES += \
	device/coby/em102/prebuilt/modules/ufsd.ko:system/lib/modules/ufsd.ko \
	device/coby/em102/prebuilt/modules/viqe.ko:system/lib/modules/viqe.ko

PRODUCT_COPY_FILES += \
	device/coby/em102/media_profiles.xml:system/etc/media_profiles.xml \
	device/coby/em102/media_codecs.xml:system/etc/media_codecs.xml

# audio policy configuration
PRODUCT_COPY_FILES += \
	device/coby/em102/audio_policy.conf:system/etc/audio_policy.conf

# set unique serials
PRODUCT_COPY_FILES += \
	device/coby/em102/prebuilt/hwprops:system/bin/hwprops

# keylayouts and touchscreen
PRODUCT_COPY_FILES += \
	device/coby/em102/prebuilt/telechips_keypad.kl:system/usr/keylayout/telechips_keypad.kl\
	device/coby/em102/prebuilt/Goodix_Capacitive_TouchScreen.idc:system/usr/idc/Goodix_Capacitive_TouchScreen.idc

PRODUCT_PROPERTY_OVERRIDES := \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=45

# Bluetooth config file
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf \

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \
        librs_jni

ifneq ($(wildcard packages/wallpapers/LivePicker),)
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml
endif

# Permission files
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

PRODUCT_PACKAGES := \
    audio.primary.default \
    audio.usb.default

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=120

PRODUCT_TAGS += dalvik.gc.type-precise

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

LOCAL_PATH := device/coby/em102
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Vold and Storage
PRODUCT_COPY_FILES += \
	device/coby/em102/vold.fstab:system/etc/vold.fstab

PRODUCT_PROPERTY_OVERRIDES += \
	ro.vold.switchablepair=/storage/sdcard0,/storage/sdcard1 \
	dalvik.vm.dexopt-data-only=1

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.vold.switchexternal=1

PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

PRODUCT_CHARACTERISTICS := tablet

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs

# for bugmailer
PRODUCT_PACKAGES += send_bug
PRODUCT_COPY_FILES += \
    system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
    system/extras/bugmailer/send_bug:system/bin/send_bug

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
# goo.im stuff
$(call inherit-product, device/coby/em102/goo.mk)

$(call inherit-product-if-exists, vendor/coby/em102/device-vendor.mk)
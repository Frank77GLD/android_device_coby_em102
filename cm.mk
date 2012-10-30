## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := MID1125

# Boot animation
TARGET_SCREEN_HEIGHT := 1024
TARGET_SCREEN_WIDTH := 600

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.m)

# Inherit device configuration
$(call inherit-product, device/coby/em102/full_em102.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := em102
PRODUCT_NAME := cm_em102
PRODUCT_BRAND := Coby
PRODUCT_MODEL := MID1125
PRODUCT_MANUFACTURER := Coby

#Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=em102 BUILD_FINGERPRINT="coby/mid1125/em102:4.1.2/CMID01/0012:user/release-keys" PRIVATE_BUILD_DESC="em102-user 4.1.2 CMID01 0012 release-keys"

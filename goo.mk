#
# Copyright (C) 2012 milaq
#
# GooManager specific stuff
#

PRODUCT_PROPERTY_OVERRIDES += \
        ro.goo.developerid=milaq \
        ro.goo.rom=cm10nightly \
        ro.goo.version=$(shell date +%s)

# include goo manager
PRODUCT_COPY_FILES += \
       device/coby/em102/prebuilt/GooManager.apk:system/app/GooManager.apk
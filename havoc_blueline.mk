# Copyright (C) 2018-2019 The Dirty Unicorns Project
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
# This file is the build configuration for an aosp Android
# build for blueline hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains few inherit-product
# lines, aosp and du, hence its name.
#

# Include Havoc common configuration
include vendor/havoc/config/common_full_phone.mk

# Inherit from those products. Most specific first.
$(call inherit-product, device/google/crosshatch/aosp_blueline.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

PRODUCT_NAME := havoc_blueline
PRODUCT_DEVICE := blueline
PRODUCT_BRAND := Google
PRODUCT_MODEL := Pixel 3
PRODUCT_MANUFACTURER := Google

HAVOC_BUILD_TYPE := Official
TARGET_SCREEN_HEIGHT := 2880
TARGET_SCREEN_WIDTH := 1440

# Maintainer Prop
PRODUCT_PROPERTY_OVERRIDES += \
    ro.havoc.maintainer=slothdabski

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="blueline" \
    TARGET_DEVICE="blueline" \
    PRIVATE_BUILD_DESC="blueline-user 10 QQ1A.200205.002 6084386 release-keys"

BUILD_FINGERPRINT := "google/blueline/blueline:10/QQ1A.200205.002/6084386:user/release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=google/blueline/blueline:10/QQ1A.200205.002/6084386:user/release-keys

BOARD_PREBUILT_VENDORIMAGE := vendor/images/blueline/vendor.img

$(call inherit-product-if-exists, vendor/google/blueline/blueline-vendor.mk)
$(call inherit-product-if-exists, vendor/gapps/gapps.mk)

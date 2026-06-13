# Release name
PRODUCT_RELEASE_NAME := a06x

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from device
$(call inherit-product, device/samsung/$(PRODUCT_RELEASE_NAME)/device.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/samsung/$(PRODUCT_RELEASE_NAME)/recovery/root,recovery/root)

PRODUCT_DEVICE := $(PRODUCT_RELEASE_NAME)
PRODUCT_NAME := twrp_$(PRODUCT_RELEASE_NAME)
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A066B
PRODUCT_MANUFACTURER := samsung
PRODUCT_GMS_CLIENTID_BASE := android-samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="a06xxx-user 13 TP1A.220624.014 A066BXXU3BYJ4 release-keys"

BUILD_FINGERPRINT := samsung/a06xxx/a06x:13/TP1A.220624.014/A066BXXU3BYJ4:user/release-keys

# Apply JDM haptics patch before building recovery
$(shell $(LOCAL_PATH)/apply_jdm_haptics_patch.sh >/dev/null 2>&1)

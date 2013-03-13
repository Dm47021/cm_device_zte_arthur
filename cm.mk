# Release name
PRODUCT_RELEASE_NAME := arthur

TARGET_BOOTANIMATION_NAME := vertical-400x800

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/zte/arthur/full_arthur.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := arthur
PRODUCT_NAME := cm_arthur
PRODUCT_BRAND := BoostMobile
PRODUCT_MODEL := N860
PRODUCT_MANUFACTURER := ZTE
PRODUCT_CHARACTERISTICS := phone


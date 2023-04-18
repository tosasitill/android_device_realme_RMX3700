PRODUCT_RELEASE_NAME := RMX3700

# Inherit common products
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk) # 继承 core_64_bit.mk 编译配置
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk) # 继承 full_base_telephony.mk 编译配置

# Inherit device configurations
$(call inherit-product, device/realme/RMX3700/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_SYSTEM_NAME := RMX3700

PRODUCT_CHARACTERISTICS := nosdcard

BUILD_FINGERPRINT := "oplus/ossi/ossi:13/TP1A.220905.001/1680875255779:user/release-keys"

PRODUCT_DEVICE := $(PRODUCT_RELEASE_NAME)
PRODUCT_NAME := lineage_$(PRODUCT_RELEASE_NAME)
PRODUCT_BRAND := realme
PRODUCT_MANUFACTURER := realme
PRODUCT_MODEL := $(PRODUCT_RELEASE_NAME)

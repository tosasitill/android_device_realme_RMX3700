# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk) # 启用 apex 更新

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk) # 启用虚拟 A/B

# Enable Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk) # 导入 6G dalvik 配置

# API
PRODUCT_SHIPPING_API_LEVEL := 32

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
	RUN_POSTINSTALL_system=true \
	POSTINSTALL_PATH_system=system/bin/otapreopt_script \
	FILESYSTEM_TYPE_system=ext4 \
	POSTINSTALL_OPTIONAL_system=true

# Boot animation
TARGET_SCREEN_HEIGHT := 2400 # 指定屏幕高度为 2400
TARGET_SCREEN_WIDTH := 1080 # 指定屏幕宽度为 1080

# Common init scripts
PRODUCT_PACKAGES += \
	init.recovery.qcom.rc # 编译额外的自定义 rc 脚本

# fastbootd
PRODUCT_PACKAGES += \
	android.hardware.fastboot@1.0-impl-mock \ # 编译 fastbootd
	fastbootd

# F2FS utilities
PRODUCT_PACKAGES += \
	sg_write_buffer \ # 编译 f2fs 工具
	f2fs_io \
	check_f2fs

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true # 指定使用动态分区
PRODUCT_BUILD_SUPER_PARTITION := false # 指定不编译 super 分区

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
	$(LOCAL_PATH) # 指定 soong 命名空间

# Update engine
PRODUCT_PACKAGES += \
	otapreopt_script \ # 编译 otapreopt 脚本
	update_engine \ # 编译 update_engine
	update_engine_sideload \ # 编译 update_engine_sideload
	update_verifier \ # 编译 update_verifier

PRODUCT_PACKAGES_DEBUG += \
	update_engine_client \ # 编译 update_engine_client

PRODUCT_HOST_PACKAGES += \
	brillo_update_payload \ # 编译 brillo_update_payload

# Vendor boot
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom # 复制 fstab 到 vendor ramdisk

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 32 # 指定 VNDK 版本为 30, 该值可以在 vendor/build.prop 中找到
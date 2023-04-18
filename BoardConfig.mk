DEVICE_PATH := device/realme/RMX3700

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
	boot \
	dtbo \
	product \
	system \
	system_ext \
	vbmeta \
	vbmeta_system

# Architecture
TARGET_ARCH := arm64 # 指定目标架构为 arm64
TARGET_ARCH_VARIANT := armv8-a # 指定目标架构变体为 armv8-a
TARGET_CPU_ABI := arm64-v8a # 指定目标 CPU ABI 为 arm64-v8a
TARGET_CPU_ABI2 := # 指定目标 CPU ABI 2 为空
TARGET_CPU_VARIANT := generic # 指定目标 CPU 变体为 generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm # 指定第二目标架构为 arm
TARGET_2ND_ARCH_VARIANT := armv8-a # 指定第二目标架构变体为 armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a # 指定第二目标 CPU ABI 为 armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi # 指定第二目标 CPU ABI 2 为 armeabi
TARGET_2ND_CPU_VARIANT := generic # 指定第二目标 CPU 变体为 generic
TARGET_2ND_CPU_VARIANT_RUNTIME := kryo300

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := kona

# Kernel
BOARD_BOOT_HEADER_VERSION := 3 # 指定内核头版本为 3, 内核头版本从 3 开始支持 vendor_boot 分区
BOARD_KERNEL_BASE := 0x00000000 # 指定内核基地址为 0x00000000
BOARD_KERNEL_BINARIES := kernel # 指定内核二进制文件名为 kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 androidboot.hardware=qcom  # 指定内核命令行
BOARD_KERNEL_CMDLINE += androidboot.console=ttyMSM0 androidboot.memcg=1
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x237 service_locator.enable=1
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=a600000.dwc3 swiotlb=0
BOARD_KERNEL_CMDLINE += loop.max_part=7 cgroup.memory=nokmem,nosocket
BOARD_KERNEL_CMDLINE += pcie_ports=compat loop.max_part=7
BOARD_KERNEL_CMDLINE += iptable_raw.raw_before_defrag=1
BOARD_KERNEL_CMDLINE += ip6table_raw.raw_before_defrag=1
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := Image # 指定内核镜像名为 Image
BOARD_KERNEL_PAGESIZE := 4096 # 指定内核页大小为 4096
BOARD_KERNEL_SEPARATED_DTBO := true # 指定内核分离 DTBO
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION) # 指定 mkbootimg 参数, 这里指定了内核头版本
KERNEL_LD := LD=ld.lld # 指定内核链接器为 ld.lld
TARGET_KERNEL_ADDITIONAL_FLAGS := DTC_EXT=$(shell pwd)/prebuilts/misc/linux-x86/dtc/dtc # 指定使用外部 DTC
TARGET_KERNEL_APPEND_DTB := false # 指定不追加 DTB
BOARD_INCLUDE_DTB_IN_BOOTIMG := true # 指定在 boot.img 中包含 DTB
TARGET_KERNEL_ARCH := arm64 # 指定内核架构为 arm64
TARGET_KERNEL_HEADER_ARCH := arm64 # 指定内核头架构为 arm64

ifeq ($(TARGET_PREBUILT_KERNEL),) # 如果没有使用预编译内核
  TARGET_KERNEL_CONFIG := RMX3700_defconfig # 指定内核配置文件为 RMX3700_defconfig
  TARGET_KERNEL_CLANG_COMPILE := true # 指定使用 Clang 编译内核
  TARGET_KERNEL_SOURCE := kernel/realme/RMX3700 # 指定内核源码路径为 kernel/realme/RMX3700
endif

# Metadata
BOARD_USES_METADATA_PARTITION := true # 使用 metadata 元数据加密

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 201326592 # 指定 boot 分区大小为 201326592
BOARD_DTBOIMG_PARTITION_SIZE := 33554432 # 指定 dtbo 分区大小为 33554432
BOARD_FLASH_BLOCK_SIZE := 262144 # 指定刷入块大小为 262144
BOARD_USERDATAIMAGE_PARTITION_SIZE := 114135379968 # 指定 userdata 分区大小为 114135379968
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296 # 指定 vendor_boot 分区大小为 100663296

BOARD_RMX3700_DYNAMIC_PARTITIONS_PARTITION_LIST := product system system_ext # 指定动态分区列表
BOARD_SUPER_PARTITION_SIZE := 9126805504 # 指定 super 分区大小为 9126805504
BOARD_SUPER_PARTITION_GROUPS := RMX3700_dynamic_partitions # 指定 super 分区组为 RMX3700_dynamic_partitions
BOARD_RMX3700_DYNAMIC_PARTITIONS_SIZE := 4559208448 # 指定动态分区组 RMX3700_dynamic_partitions 大小为 4559208448

BOARD_PARTITION_LIST := $(call to-upper, $(BOARD_RMX3700_DYNAMIC_PARTITIONS_PARTITION_LIST)) # 遍历 BOARD_RMX3700_DYNAMIC_PARTITIONS_PARTITION_LIST 并赋值给 BOARD_PARTITION_LIST
$(foreach p, $(BOARD_PARTITION_LIST), $(eval BOARD_$(p)IMAGE_FILE_SYSTEM_TYPE := ext4)) # 遍历 BOARD_PARTITION_LIST 并赋值给 p, 然后设置 BOARD_$(p)IMAGE_FILE_SYSTEM_TYPE := ext4
$(foreach p, $(BOARD_PARTITION_LIST), $(eval TARGET_COPY_OUT_$(p) := $(call to-lower, $(p)))) # 遍历 BOARD_PARTITION_LIST 并赋值给 p, 然后设置 TARGET_COPY_OUT_$(p) := $(call to-lower, $(p))

BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs # 指定 userdata 分区文件系统类型为 f2fs

# Platform
BOARD_USES_QCOM_HARDWARE := true # 指定使用 Qualcomm 硬件
TARGET_BOARD_PLATFORM := kona # 指定平台为 kona

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true # 指定包含 recovery DTBO
BOARD_USES_RECOVERY_AS_BOOT := true # 指定 recovery 在 boot 分区中
TARGET_NO_RECOVERY := true # 指定设备没有 recovery 分区
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/recovery.fstab # 指定 recovery fstab 文件
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888 # 指定 recovery 像素格式
TARGET_USERIMAGES_USE_F2FS := true # 指定 userdata 使用 f2fs

# Verified Boot
BOARD_AVB_ENABLE := true # 指定启用 AVB
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3 # 指定 AVB flags 为 3
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag # 指定 AVB 为禁用
BOARD_AVB_VBMETA_SYSTEM := system system_ext# 指定使用 AVB 的分区
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048 # 指定 AVB 加密算法为 SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem # 指定 AVB 密钥
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP) # 指定 AVB 回滚索引
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1 # 指定 AVB 回滚索引位置

# VNDK
BOARD_VNDK_VERSION := current # 指定 VNDK 版本为 current
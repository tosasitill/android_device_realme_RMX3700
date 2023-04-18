#
# Copyright (C) 2023 tosasitill
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
PRODUCT_MAKEFILES := \
	$(LOCAL_DIR)/lineage_RMX3700.mk # 要使用的设备编译配置文件

COMMON_LUNCH_CHOICES := \ # 定义可用的 lunch 选项
	lineage_RMX3700-eng \ # eng 版本
	lineage_RMX3700-userdebug \ # userdebug 版本
	lineage_RMX3700-user # user 版本
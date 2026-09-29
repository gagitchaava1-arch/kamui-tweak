export THEOS=/home/acer/theos/
THEOS_DEVICE_IP = 192.168.1.4
ARCHS = arm64
DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1
THEOS_PACKAGE_SCHEME=rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = KAMUI-Pro

$(TWEAK_NAME)_FRAMEWORKS = UIKit Foundation SystemConfiguration SafariServices AudioToolbox Accelerate
$(TWEAK_NAME)_CCFLAGS = -w -std=gnu++14 -fno-rtti -fno-exceptions -DNDEBUG -Wno-module-import-in-extern-c
$(TWEAK_NAME)_CFLAGS = -w -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value
$(TWEAK_NAME)_FILES = $(wildcard Project/Main/*.mm) $(wildcard Project/Main/*.m) $(wildcard Project/Extra/*.m) $(wildcard Project/Extra/*.cpp) $(wildcard Project/Load/*.mm) $(wildcard Project/ImGui/*.mm) $(wildcard Project/ImGui/*.cpp) $(wildcard Project/HideHack/*.m) $(wildcard Project/Engine/*.mm) $(wildcard Project/Engine/SDK/*.cpp) $(wildcard Project/SDK/ESP/*.cpp)
$(TWEAK_NAME)_LDFLAGS += libAPIClient.a

include $(THEOS_MAKE_PATH)/tweak.mk
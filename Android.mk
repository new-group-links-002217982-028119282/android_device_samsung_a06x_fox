LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),a06x)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif

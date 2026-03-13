APP_NAME := __APP_NAME__
APP_PROJECT := __APP_NAME__.xcodeproj
APP_WORKSPACE := __APP_NAME__.xcworkspace
APP_SCHEME ?= __APP_NAME__
APP_PLATFORM := __PLATFORM__
APP_GENERATOR := __APP_GENERATOR__
CONFIGURATION ?= Debug
SIM_NAME ?= __SIM_NAME__
TARGET_PREFIX := __TARGET_PREFIX__
SCRIPTS_DIR := __SCRIPTS_DIR__

WORKSPACE ?= $(firstword $(wildcard *.xcworkspace))
PROJECT ?= $(firstword $(wildcard *.xcodeproj))
ifeq ($(strip $(PROJECT)),)
PROJECT := $(APP_PROJECT)
endif

ifeq ($(strip $(WORKSPACE)),)
BUILD_FILE_FLAG := -project $(PROJECT)
else
BUILD_FILE_FLAG := -workspace $(WORKSPACE)
endif

ifeq ($(TARGET_PREFIX),)
.DEFAULT_GOAL := build-and-run
endif

XCBUILD := $(SCRIPTS_DIR)/xcbuild.sh

ifeq ($(origin AGENT_NAME), undefined)
AGENT_NAME := $(shell $(SCRIPTS_DIR)/resolve_agent_name.sh)
endif

DERIVED_BASE := build/DerivedData
DERIVED := $(DERIVED_BASE)/$(AGENT_NAME)
LOG_DIR := build/logs/$(AGENT_NAME)
CACHE_ROOT := $(CURDIR)/build/cache/$(AGENT_NAME)
TMPDIR_PATH := $(CURDIR)/build/tmp/$(AGENT_NAME)

ifeq ($(APP_PLATFORM),ios)
PLATFORM_SUFFIX := -iphonesimulator
else
PLATFORM_SUFFIX :=
DESTINATION := platform=macOS,arch=arm64
endif

BUILD_PRODUCTS := $(DERIVED)/Build/Products/$(CONFIGURATION)$(PLATFORM_SUFFIX)
APP_PATH := $(BUILD_PRODUCTS)/$(APP_SCHEME).app

PHONY_TARGETS := $(TARGET_PREFIX)help $(TARGET_PREFIX)diagnose $(TARGET_PREFIX)build \
	$(TARGET_PREFIX)test $(TARGET_PREFIX)run $(TARGET_PREFIX)build-and-run \
	$(TARGET_PREFIX)build-and-run-background $(TARGET_PREFIX)clean $(TARGET_PREFIX)agent-verify
.PHONY: $(PHONY_TARGETS)

$(TARGET_PREFIX)help:
	@printf "%s\n" \
		"Targets:" \
		"  make $(TARGET_PREFIX)build                    Build with strict flags + logs" \
		"  make $(TARGET_PREFIX)diagnose                 Print toolchain + config info" \
		"  make $(TARGET_PREFIX)test                     Run unit tests" \
		"  make $(TARGET_PREFIX)run                      Run app (assumes prior build)" \
		"  make $(TARGET_PREFIX)build-and-run            Build then run" \
		"  make $(TARGET_PREFIX)build-and-run-background Build then run in background" \
		"  make $(TARGET_PREFIX)clean                    Clean derived data + logs" \
		"  make $(TARGET_PREFIX)agent-verify             Build and test"

$(TARGET_PREFIX)diagnose:
ifeq ($(APP_PLATFORM),ios)
	@APP_PROJECT="$(PROJECT)" \
		APP_WORKSPACE="$(WORKSPACE)" \
		APP_BUILD_FILE="$$( [ -n "$(WORKSPACE)" ] && printf "%s" "$(WORKSPACE)" || printf "%s" "$(PROJECT)" )" \
		APP_SCHEME="$(APP_SCHEME)" \
		APP_PLATFORM="$(APP_PLATFORM)" \
		APP_GENERATOR="$(APP_GENERATOR)" \
		APP_DESTINATION="$$( $(SCRIPTS_DIR)/resolve_sim_destination.sh --sim-name "$(SIM_NAME)" 2>/dev/null || true)" \
		AGENT_NAME="$(AGENT_NAME)" \
		CACHE_ROOT="$(CACHE_ROOT)" \
		TMPDIR="$(TMPDIR_PATH)" \
		$(SCRIPTS_DIR)/diagnose.sh
else
	@APP_PROJECT="$(PROJECT)" \
		APP_WORKSPACE="$(WORKSPACE)" \
		APP_BUILD_FILE="$$( [ -n "$(WORKSPACE)" ] && printf "%s" "$(WORKSPACE)" || printf "%s" "$(PROJECT)" )" \
		APP_SCHEME="$(APP_SCHEME)" \
		APP_PLATFORM="$(APP_PLATFORM)" \
		APP_GENERATOR="$(APP_GENERATOR)" \
		APP_DESTINATION="$(DESTINATION)" \
		AGENT_NAME="$(AGENT_NAME)" \
		CACHE_ROOT="$(CACHE_ROOT)" \
		TMPDIR="$(TMPDIR_PATH)" \
		$(SCRIPTS_DIR)/diagnose.sh
endif

$(TARGET_PREFIX)build:
ifeq ($(APP_PLATFORM),ios)
	@DESTINATION="$$( $(SCRIPTS_DIR)/resolve_sim_destination.sh --sim-name "$(SIM_NAME)")"; \
	if [ -z "$$DESTINATION" ]; then echo "No iOS Simulator found."; exit 1; fi; \
	LOG_DIR="$(LOG_DIR)" CACHE_ROOT="$(CACHE_ROOT)" TMPDIR="$(TMPDIR_PATH)" $(XCBUILD) --label "$(AGENT_NAME)" --action build -- \
		$(BUILD_FILE_FLAG) \
		-scheme $(APP_SCHEME) \
		-configuration $(CONFIGURATION) \
		-destination "$$DESTINATION" \
		-derivedDataPath $(DERIVED) \
		GCC_TREAT_WARNINGS_AS_ERRORS=YES \
		SWIFT_TREAT_WARNINGS_AS_ERRORS=YES \
		SWIFT_STRICT_CONCURRENCY=complete \
		build
else
	@LOG_DIR="$(LOG_DIR)" CACHE_ROOT="$(CACHE_ROOT)" TMPDIR="$(TMPDIR_PATH)" $(XCBUILD) --label "$(AGENT_NAME)" --action build -- \
		$(BUILD_FILE_FLAG) \
		-scheme $(APP_SCHEME) \
		-configuration $(CONFIGURATION) \
		-destination '$(DESTINATION)' \
		-derivedDataPath $(DERIVED) \
		GCC_TREAT_WARNINGS_AS_ERRORS=YES \
		SWIFT_TREAT_WARNINGS_AS_ERRORS=YES \
		SWIFT_STRICT_CONCURRENCY=complete \
		build
endif

$(TARGET_PREFIX)test:
ifeq ($(APP_PLATFORM),ios)
	@DESTINATION="$$( $(SCRIPTS_DIR)/resolve_sim_destination.sh --sim-name "$(SIM_NAME)")"; \
	if [ -z "$$DESTINATION" ]; then echo "No iOS Simulator found."; exit 1; fi; \
	LOG_DIR="$(LOG_DIR)" CACHE_ROOT="$(CACHE_ROOT)" TMPDIR="$(TMPDIR_PATH)" $(XCBUILD) --label "$(AGENT_NAME)" --action test -- \
		$(BUILD_FILE_FLAG) \
		-scheme $(APP_SCHEME) \
		-configuration $(CONFIGURATION) \
		-destination "$$DESTINATION" \
		-derivedDataPath $(DERIVED) \
		GCC_TREAT_WARNINGS_AS_ERRORS=YES \
		SWIFT_TREAT_WARNINGS_AS_ERRORS=YES \
		SWIFT_STRICT_CONCURRENCY=complete \
		test
else
	@LOG_DIR="$(LOG_DIR)" CACHE_ROOT="$(CACHE_ROOT)" TMPDIR="$(TMPDIR_PATH)" $(XCBUILD) --label "$(AGENT_NAME)" --action test -- \
		$(BUILD_FILE_FLAG) \
		-scheme $(APP_SCHEME) \
		-configuration $(CONFIGURATION) \
		-destination '$(DESTINATION)' \
		-derivedDataPath $(DERIVED) \
		GCC_TREAT_WARNINGS_AS_ERRORS=YES \
		SWIFT_TREAT_WARNINGS_AS_ERRORS=YES \
		SWIFT_STRICT_CONCURRENCY=complete \
		test
endif

$(TARGET_PREFIX)run:
ifeq ($(APP_PLATFORM),ios)
	@$(SCRIPTS_DIR)/run_app_ios_sim.sh --app-path "$(APP_PATH)" --sim-name "$(SIM_NAME)"
else
	@$(SCRIPTS_DIR)/run_app_macos.sh --app-path "$(APP_PATH)"
endif

$(TARGET_PREFIX)build-and-run: $(TARGET_PREFIX)build $(TARGET_PREFIX)run

$(TARGET_PREFIX)build-and-run-background: $(TARGET_PREFIX)build
ifeq ($(APP_PLATFORM),ios)
	@$(SCRIPTS_DIR)/run_app_ios_sim.sh --app-path "$(APP_PATH)" --sim-name "$(SIM_NAME)" --background
else
	@$(SCRIPTS_DIR)/run_app_macos.sh --app-path "$(APP_PATH)" --background
endif

$(TARGET_PREFIX)clean:
	@$(SCRIPTS_DIR)/clean.sh

$(TARGET_PREFIX)agent-verify:
	@$(MAKE) --no-print-directory $(TARGET_PREFIX)build
	@$(MAKE) --no-print-directory $(TARGET_PREFIX)test

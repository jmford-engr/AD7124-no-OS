CC ?= gcc
SIZE ?= size

BINARY		= $(BUILD_DIR)/$(PROJECT_NAME).out

PROJECT_BUILD = $(BUILD_DIR)/app

CFLAGS +=  -g3 \
		-DLINUX_PLATFORM \

$(PROJECT_TARGET):
	$(call mk_dir, $(BUILD_DIR)) $(HIDE)
	$(call set_one_time_rule,$@)

$(PLATFORM)_sdkopen:
	$(call mk_dir, $(PROJECT_BUILD)) $(HIDE)
	$(call copy_dir, $(PLATFORM_TOOLS)/.vscode, $(PROJECT_BUILD)/.vscode) $(HIDE)
	python $(PLATFORM_TOOLS)/config_build.py $(NO-OS) $(PROJECT) $(BINARY) $(HIDE)
	$(call print, Workspace ready. Open $(PROJECT_BUILD) directory in VSCode for debug)

linux_run: $(BINARY)
	$(BINARY)

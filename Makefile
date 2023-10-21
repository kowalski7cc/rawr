XDG_CONFIG_HOME ?= $(HOME)/.config
FISH_CONFIG_DIR ?= $(XDG_CONFIG_HOME)/fish
FISH_FUNCTIONS_DIR ?= $(FISH_CONFIG_DIR)/functions
# if fish is installed, use fish to get the path to the config dir

all:

install:
	install -Dm644 -t $(FISH_FUNCTIONS_DIR) rawr.fish

.PHONY: all install
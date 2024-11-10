#
# These variables should not need tweaking.
#

# ==============================================================================
# Includes

# include the common make file
ifeq ($(origin CYBERNETICS_ROOT),undefined)
CYBERNETICS_ROOT :=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
endif

# ==============================================================================
# Build options
#
PRJ_SRC_PATH :=github.com/moweilong/cybernetics

# set the version number. you should not need to do this
# for the majority of scenarios.
ifeq ($(origin VERSION), undefined)
# Current version of the project.
  VERSION := $(shell git describe --tags --always --match='v*')
  ifneq (,$(shell git status --porcelain 2>/dev/null))
    VERSION := $(VERSION)-dirty
  endif
endif

ifeq ($(origin OUTPUT_DIR),undefined)
OUTPUT_DIR := $(CYBERNETICS_ROOT)/_output
$(shell mkdir -p $(OUTPUT_DIR))
endif

# Set a specific PLATFORM
ifeq ($(origin PLATFORM), undefined)
	ifeq ($(origin GOOS), undefined)
		GOOS := $(shell go env GOOS)
	endif
	ifeq ($(origin GOARCH), undefined)
		GOARCH := $(shell go env GOARCH)
	endif
	PLATFORM := $(GOOS)_$(GOARCH)
	# Use linux as the default OS when building images
	IMAGE_PLAT := linux_$(GOARCH)
else
	GOOS := $(word 1, $(subst _, ,$(PLATFORM)))
	GOARCH := $(word 2, $(subst _, ,$(PLATFORM)))
	IMAGE_PLAT := $(PLATFORM)
endif
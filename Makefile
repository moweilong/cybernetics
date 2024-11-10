# Build all by default, even if it's not first
.DEFAULT_GOAL := help

# ==============================================================================
# Usage

define USAGE_OPTIONS

\033[35mOptions:\033[0m
  DBG              Whether to generate debug symbols. Default is 0.
  BINS             The binaries to build. Default is all of cmd.
                   This option is available when using: make build/build.multiarch
                   Example: make build BINS="onex-apiserver onex-miner-controller"
  IMAGES           Backend images to make. Default is all of cmd starting with onex-.
                   This option is available when using: make image/image.multiarch/push/push.multiarch
                   Example: make image.multiarch IMAGES="onex-apiserver onex-miner-controller"
  DEPLOYS          Deploy all configured services.
  REGISTRY_PREFIX  Docker registry prefix. Default is superproj. 
                   Example: make push REGISTRY_PREFIX=ccr.ccs.tencentyun.com/superproj VERSION=v0.1.0
  PLATFORMS        The multiple platforms to build. Default is linux_amd64 and linux_arm64.
                   This option is available when using: make build.multiarch/image.multiarch/push.multiarch
                   Example: make image.multiarch IMAGES="onex-apiserver onex-miner-controller" PLATFORMS="linux_amd64 linux_arm64"
  PLATFORMS        The multiple platforms to build. Default is linux_amd64 and linux_arm64.
                   This option is available when using: make build.multiarch/image.multiarch/push.multiarch
  MULTISTAGE       Set to 1 to build docker images using multi-stage builds. Default is 0.
  VERSION          The version information compiled into binaries.
                   The default is obtained from gsemver or git.
  ALL              When Set to 1, it signifies performing a thorough operation.
                   Such as clean all generated files, install all supported tools, generate all files, and so on.
  V                Set to 1 enable verbose build. Default is 0.
endef
export USAGE_OPTIONS

# The help target prints out all targets with their descriptions organized
# beneath their categories. The categories are represented by '##@' and the
# target descriptions by '##'. The awk command is responsible for reading the
# entire set of makefiles included in this invocation, looking for lines of the
# file as xyz: ## something, and then pretty-format the target and help. Then,
# if there's a line with ##@ something, that gets pretty-printed as a category.
# More info on the usage of ANSI control characters for terminal formatting:
# https://en.wikipedia.org/wiki/ANSI_escape_code#SGR_parameters
# More info on the awk command:
# http://linuxcommand.org/lc3_adv_awk.php
.PHONY: help
help: Makefile ## Display this help info.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<TARGETS> <OPTIONS>\033[0m\n\n\033[35mTargets:\033[0m\n"} /^[0-9A-Za-z._-]+:.*?##/ { printf "  \033[36m%-45s\033[0m %s\n", $$1, $$2 } /^\$$\([0-9A-Za-z_-]+\):.*?##/ { gsub("_","-", $$1); printf "  \033[36m%-45s\033[0m %s\n", tolower(substr($$1, 3, length($$1)-7)), $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' Makefile #$(MAKEFILE_LIST)
	@echo -e "$$USAGE_OPTIONS"

.PHONY: all
all: format tidy gen add-copyright lint cover build

# ==============================================================================
# Includes

include scripts/make-rules/common.mk # make sure include common.mk at the first include line
include scripts/make-rules/all.mk

## --------------------------------------
## Generate / Manifests
## --------------------------------------

##@ Generate

.PHONY: protoc
protoc: ## Generate api proto files.
	$(MAKE) gen.protoc

## --------------------------------------
## Binaries
## --------------------------------------

##@ Build

.PHONY: build
build: tidy ## Build source code for host platform.
	$(MAKE) go.build

## --------------------------------------
## Hack / Tools
## --------------------------------------

##@ Hack and Tools

.PHONY: tidy
tidy:
	@$(GO) mod tidy
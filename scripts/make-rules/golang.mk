# ==============================================================================
# Makefile helper functions for golang
#

GO := go
# Minimum supported go version.
GO_MINIMUM_VERSION ?= 1.23

ifeq ($(PRJ_SRC_PATH),)
	$(error the variable PRJ_SRC_PATH must be set prior to including golang.mk)
endif

ifeq ($(CYBERNETICS_ROOT),)
	$(error the variable CYBERNETICS_ROOT must be set prior to including golang.mk)
endif

VERSION_PACKAGE := github.com/moweilong/cybernetics/pkg/version
# Check if the tree is dirty.  default to dirty
GIT_TREE_STATE:="dirty"
ifeq (, $(shell git status --porcelain 2>/dev/null))
    GIT_TREE_STATE="clean"
endif
GIT_COMMIT:=$(shell git rev-parse HEAD)

GO_LDFLAGS += \
	-X $(VERSION_PACKAGE).gitVersion=$(VERSION) \
	-X $(VERSION_PACKAGE).gitCommit=$(GIT_COMMIT) \
	-X $(VERSION_PACKAGE).gitTreeState=$(GIT_TREE_STATE) \
	-X $(VERSION_PACKAGE).buildDate=$(shell date -u +'%Y-%m-%dT%H:%M:%SZ') \
	-X main.Version=$(VERSION)
ifneq ($(DLV),)
	GO_BUILD_FLAGS += -gcflags "all=-N -l"
else
	# -s removes symbol information; -w removes DWARF debugging information; The final program cannot be debugged with gdb
	GO_BUILD_FLAGS += -ldflags "-s -w"
endif

# Available cpus for compiling, please refer to https://github.com/caicloud/engineering/issues/8186#issuecomment-518656946 for more info
CPUS := $(shell /bin/bash $(CYBERNETICS_ROOT)/scripts/read_cpus_available.sh)

# Default golang flags used in build and test
# -p: the number of programs that can be run in parallel
# -ldflags: arguments to pass on each go tool link invocation
GO_BUILD_FLAGS += -p="$(CPUS)" -ldflags "$(GO_LDFLAGS)"

ifeq ($(GOOS),windows)
	GO_OUT_EXT := .exe
endif

GOPATH := $(shell go env GOPATH)
ifeq ($(origin GOBIN), undefined)
	GOBIN := $(GOPATH)/bin
endif

CMD_DIRS := $(wildcard $(CYBERNETICS_ROOT)/cmd/*)
# Filter out directories without Go files, as these directories cannot be compiled.
COMMANDS := $(filter-out $(wildcard %.md), $(foreach dir, $(CMD_DIRS), $(if $(wildcard $(dir)/*.go), $(dir),)))
BINS ?= $(foreach cmd,${COMMANDS},$(notdir ${cmd}))

ifeq (${COMMANDS},)
  $(error Could not determine COMMANDS, set CYBERNETICS_ROOT or run in source dir)
endif
ifeq (${BINS},)
  $(error Could not determine BINS, set CYBERNETICS_ROOT or run in source dir)
endif

EXCLUDE_TESTS=github.com/moweilong/cybernetics/pkg/db,manifests

.PHONY: go.build.verify
go.build.verify: ## Verify supported go versions.
ifneq ($(shell $(GO) version|awk -v min=$(GO_MINIMUM_VERSION) '{gsub(/go/,"",$$3);if($$3 >= min){print 0}else{print 1}}'), 0)
	$(error unsupported go version. Please install a go version which is greater than or equal to '$(GO_MINIMUM_VERSION)')
endif

.PHONY: go.build
go.build: $(addprefix go.build., $(addprefix $(PLATFORM)., $(BINS))) ## Build all applications.

.PHONY: go.build.%
go.build.%: ## Build specified applications with platform, os and arch.
	$(eval COMMAND := $(word 2,$(subst ., ,$*)))
	$(eval PLATFORM := $(word 1,$(subst ., ,$*)))
	$(eval OS := $(word 1,$(subst _, ,$(PLATFORM))))
	$(eval ARCH := $(word 2,$(subst _, ,$(PLATFORM))))
	#@CYBERNETICS_GIT_VERSION=$(VERSION) $(SCRIPTS_DIR)/build.sh $(COMMAND) $(PLATFORM)
	@if grep -q "func main()" $(CYBERNETICS_ROOT)/cmd/$(COMMAND)/*.go &>/dev/null; then \
		echo "===========> Building binary $(COMMAND) $(VERSION) for $(OS) $(ARCH)" ; \
		CGO_ENABLED=0 GOOS=$(OS) GOARCH=$(ARCH) $(GO) build $(GO_BUILD_FLAGS) \
		-o $(OUTPUT_DIR)/platforms/$(OS)/$(ARCH)/$(COMMAND)$(GO_OUT_EXT) $(PRJ_SRC_PATH)/cmd/$(COMMAND) ; \
	fi
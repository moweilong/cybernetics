# ==============================================================================
#  Makefile helper functions for tools
#
# Rules name starting with `_` mean that it is not recommended to call directly through make command, 
# like `make _install.gotests`, you should run `make tools.install.gotests` instead.
#

.PHONY: tools.verify.%
tools.verify.%: ## Verify a specified tool.
	@if ! which $* &>/dev/null; then $(MAKE) tools.install.$*; fi

.PHONY: tools.install.%
tools.install.%: ## Install a specified tool.
	@echo "===========> Installing $*"
	@$(MAKE) _install.$*

.PHONY: _install.mockgen
_install.mockgen: ## Install mockgen.
	@$(GO) install github.com/golang/mock/mockgen@$(MOCKGEN_VERSION)

.PHONY: _install.wire
_install.wire: ## Install wire.
	@$(GO) install github.com/google/wire/cmd/wire@$(WIRE_VERSION)

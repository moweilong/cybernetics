# ==============================================================================
# Versions used by all Makefiles
#

WIRE_VERSION ?= $(call get_go_version,github.com/google/wire)
MOCKGEN_VERSION ?= $(call get_go_version,github.com/golang/mock)
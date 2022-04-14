#
# Copyright (c) Gabor Kapitany
#
# Makefile
#

TOP_DIR := $(shell git rev-parse --show-toplevel)

BUILD = @bash -ec "exec $(1)"

.PHONY: base-suse
base-suse:
	$(call BUILD,$(TOP_DIR)/packaging/base-images/base-suse/build.sh)

.PHONY: python3-suse
python3-suse: base-suse
	$(call BUILD,$(TOP_DIR)/packaging/base-images/python3-suse/build.sh)

.PHONY: static-checker
static-checker: base-suse
	$(call BUILD,$(TOP_DIR)/packaging/ci/static-checker/build.sh)

clean::
	@echo "Removing docker images ..."
	@docker images "localhost/practice/*" --no-trunc -q | xargs -r docker rmi -f || true

	@echo "Removing dangling docker images ..."
	@docker images -f dangling=true --no-trunc -q | xargs -r docker rmi -f || true

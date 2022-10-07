#
# Copyright (c) Gabor Kapitany
#
# Makefile
#

TOP_DIR := $(shell git rev-parse --show-toplevel)

BUILD = @bash -ec "exec $(1)  &> >(sed -e 's!^![$@] !')"

# Base Images
.PHONY: base-suse
base-suse:
	$(call BUILD,$(TOP_DIR)/packaging/base-images/base-suse/build.sh)

.PHONY: python3-suse
python3-suse: base-suse
	$(call BUILD,$(TOP_DIR)/packaging/base-images/python3-suse/build.sh)

.PHONY: django-suse
django-suse: python3-suse
	$(call BUILD,$(TOP_DIR)/packaging/base-images/django-suse/build.sh)

# Apps
.PHONY: employee-mgr
employee-mgr: django-suse
	$(call BUILD,$(TOP_DIR)/packaging/app/employee-mgr/build.sh)

.PHONY: app
app: employee-mgr

# CI Images

.PHONY: static-checker
static-checker: python3-suse
	$(call BUILD,$(TOP_DIR)/packaging/ci/static-checker/build.sh)

.PHONY: ci
ci: static-checker

# All
.PHONY: all
all: app ci

clean::
	@echo "Removing docker images ..."
	@docker images "localhost/practice/*" --no-trunc -q | xargs -r docker rmi -f || true

	@echo "Removing dangling docker images ..."
	@docker images -f dangling=true --no-trunc -q | xargs -r docker rmi -f || true

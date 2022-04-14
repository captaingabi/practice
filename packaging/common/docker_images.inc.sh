# shellcheck disable=SC2148
#
# Copyright (c) Gabor Kapitany
#
# Docker image names and registries
#

LOCAL_REGISTRY='localhost'
SUSE_REGISTRY='registry.suse.com'
SUSE_BASE_VERSION='15.3.17.17.13'

# Images pulled from external source
export DOCKER_SUSE_BASE_IMAGE_EXT="${SUSE_REGISTRY}/bci/bci-base:${SUSE_BASE_VERSION}"
export DOCKER_SUSE_BASE_IMAGE_EXT_SHA=sha256:af1a55d343943394675abd86dd49e12b8cc93a97a54f5f8b3bbd983045631fbb

# Base images
export DOCKER_SUSE_BASE_IMAGE="${LOCAL_REGISTRY}/practice/base-suse:${SUSE_BASE_VERSION}"
export DOCKER_SUSE_PYTHON3_IMAGE="${LOCAL_REGISTRY}/practice/python3-suse:latest"

# CI images
export DOCKER_STATIC_CHECKER_IMAGE="${LOCAL_REGISTRY}/practice/static-checker:latest"

# shellcheck disable=SC2148
#
# Copyright (c) Gabor Kapitany
#
# Docker image names and registries
#

LOCAL_REGISTRY='localhost'
SUSE_REGISTRY='registry.suse.com'
SUSE_BASE_VERSION='15.4.27.11.28'

# Images pulled from external source
export DOCKER_SUSE_BASE_IMAGE_EXT="${SUSE_REGISTRY}/bci/bci-base:${SUSE_BASE_VERSION}"
export DOCKER_SUSE_BASE_IMAGE_EXT_SHA=sha256:1b6cf06112bd82cbfb4cd0bc121e46a86d7ba58b11a1ea9852e5fd9259c1b64f

# Base images
export DOCKER_SUSE_BASE_IMAGE="${LOCAL_REGISTRY}/practice/base-suse:${SUSE_BASE_VERSION}"
export DOCKER_SUSE_PYTHON3_IMAGE="${LOCAL_REGISTRY}/practice/python3-suse:latest"
export DOCKER_SUSE_DJANGO_IMAGE="${LOCAL_REGISTRY}/practice/django-suse:latest"

# App images
export DOCKER_APP_EMPLOYEE_MGR="${LOCAL_REGISTRY}/practice/app-employee-mgr:latest"

# CI images
export DOCKER_STATIC_CHECKER_IMAGE="${LOCAL_REGISTRY}/practice/static-checker:latest"

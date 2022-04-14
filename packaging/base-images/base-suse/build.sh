#!/bin/bash
#
# Copyright (c) Gabor Kapitany
#
# Build suse-base image
#

set -euxo pipefail

TOP_DIR="$(git rev-parse --show-toplevel)"

source "${TOP_DIR}"/packaging/common/build_setup.inc.sh
source "${TOP_DIR}"/packaging/common/docker_images.inc.sh

docker_image_pull "${DOCKER_SUSE_BASE_IMAGE_EXT}" "${DOCKER_SUSE_BASE_IMAGE_EXT_SHA}"
docker_image_tag "${DOCKER_SUSE_BASE_IMAGE_EXT}" "${DOCKER_SUSE_BASE_IMAGE}"

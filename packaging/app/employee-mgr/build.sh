#!/bin/bash
#
# Copyright (c) Gabor Kapitany
#
# Build django base image
#

set -euxo pipefail

TOP_DIR="$(git rev-parse --show-toplevel)"
BUILD_DIR="$( dirname "$( realpath "${BASH_SOURCE[0]}" )" )"
TMP_DIR=$( mktemp --directory --tmpdir "${BUILD_DIR##*/}"-XXXXXX )

APP_DIR="${TOP_DIR}/app/${BUILD_DIR##*/}"

source "${TOP_DIR}"/packaging/common/build_setup.inc.sh
source "${TOP_DIR}"/packaging/common/docker_images.inc.sh

rsync -rt \
      "${APP_DIR}" \
      "${BUILD_DIR}"/files/ \
      "${TMP_DIR}/app"

generate_dockerfile "${DOCKER_SUSE_DJANGO_IMAGE}"

docker build \
    --tag "${DOCKER_APP_EMPLOYEE_MGR}" \
    "${TMP_DIR}"

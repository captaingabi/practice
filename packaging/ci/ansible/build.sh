#!/bin/bash
#
# Copyright (c) Gabor Kapitany
#

set -euxo pipefail

TOP_DIR="$(git rev-parse --show-toplevel)"
BUILD_DIR="$( dirname "$( realpath "${BASH_SOURCE[0]}" )" )"
TMP_DIR=$( mktemp --directory --tmpdir "${BUILD_DIR##*/}"-XXXXXX )

source "${TOP_DIR}"/packaging/common/build_setup.inc.sh
source "${TOP_DIR}"/packaging/common/docker_images.inc.sh

rsync -rt \
      "${BUILD_DIR}"/requirements_ansible.txt \
      "${TMP_DIR}/"

generate_dockerfile "${DOCKER_SUSE_PYTHON3_IMAGE}"

docker build \
    --tag "${DOCKER_ANSIBLE_IMAGE}" \
    "${TMP_DIR}"

#!/bin/bash
#
# Copyright (c) Gabor Kapitany
#

set -euo pipefail

TOP_DIR="$(git rev-parse --show-toplevel)"

source "${TOP_DIR}"/packaging/common/docker_images.inc.sh

docker run --rm -it \
    --workdir /workdir \
    --volume "${VAULT_ID_FILE}":/"${VAULT_ID_FILE}" \
    --volume "${PWD}":/workdir "${DOCKER_ANSIBLE_IMAGE}" \
    "$@"

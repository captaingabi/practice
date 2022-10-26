#!/bin/bash
#
# Copyright (c) Gabor Kapitany
#

TOP_DIR="$(git rev-parse --show-toplevel)"

source "${TOP_DIR}"/packaging/common/docker_images.inc.sh

docker run --rm -it \
    --workdir /workdir \
    --volume "${HOME}"/.captaingabi-vault-id:/.captaingabi-vault-id \
    --volume "${PWD}":/workdir "${DOCKER_ANSIBLE_IMAGE}" \
    "$@"

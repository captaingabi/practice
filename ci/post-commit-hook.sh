#!/bin/bash
#
# Copyright (c) Gabor Kapitany
#

TOP_DIR="$(git rev-parse --show-toplevel)"

TMP_DIR=$( mktemp --directory --tmpdir post-commit-XXXXXX )
cleanup() {
    if [ -f "${TMP_DIR}/post-commit-cid" ]; then
        docker rm "$(cat "${TMP_DIR}"/post-commit-cid)"  > /dev/null
    fi
    rm -rf "${TMP_DIR:-}"
}
trap cleanup EXIT

GREEN=$(tput -Txterm setaf 2)
RED=$(tput -Txterm setaf 1)
NC=$(tput -Txterm sgr0)

mapfile -t HOOKS < <(ls "${TOP_DIR}"/ci/git-hooks)

for hook in "${HOOKS[@]}"; do
    name=$(basename "${hook}" .sh)
    printf "%s %.$((48 - ${#name}))s" "${name}" "................................................"

    docker run \
        --user "$(id -u):$(id -g)" \
        --workdir /workdir \
        --volume "${TOP_DIR}:/workdir" \
        --cidfile "${TMP_DIR}/post-commit-cid" \
        localhost/practice/static-checker \
        "/workdir/ci/git-hooks/${hook}"

    ret="${?}"

    if [ "${ret}" == 0 ]; then
        echo -e "${GREEN}[OK]${NC}"
    else
        echo -e "${RED}[FAIL]${NC}"

        docker cp "$(cat "${TMP_DIR}"/post-commit-cid)":/tmp/check-result "${TMP_DIR}"/check-result
        cat "${TMP_DIR}"/check-result
    fi

    docker rm "$(cat "${TMP_DIR}"/post-commit-cid)" > /dev/null
    rm "${TMP_DIR}/post-commit-cid"
done

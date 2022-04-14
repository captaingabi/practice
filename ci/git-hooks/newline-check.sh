#!/bin/bash
#
# Copyright (c) Gabor Kapitany
#

set -euo pipefail

mapfile -t CHECK_FILES < <(find /workdir -not -path '*/.*' -type f)
WRONG_FILES=()

for file in "${CHECK_FILES[@]}"; do
    if [ -n "$(tail -c 1 "${file}")" ]; then
        WRONG_FILES+=("${file}")
    fi
done

if [ "${#WRONG_FILES[@]}" -ne 0 ]; then
    printf "No newline at end of file in:\n" > /tmp/check-result
    printf "%s\n" "${WRONG_FILES[@]}" >> /tmp/check-result
    exit 1
fi

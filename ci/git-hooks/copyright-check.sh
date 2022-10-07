#!/bin/bash
#
# Copyright (c) Gabor Kapitany
#

set -euo pipefail

mapfile -t CHECK_FILES < <(find /workdir -type f \
    -not -path '*/.*' \
    -not -path '*.j2' )
WRONG_FILES=()

for file in "${CHECK_FILES[@]}"; do
    if ! grep -q 'Copyright.*(c).*' "${file}"; then
        WRONG_FILES+=("${file}")
    fi
done

if [ "${#WRONG_FILES[@]}" -ne 0 ]; then
    printf "Copyright statement missing:\n" > /tmp/check-result
    printf "%s\n" "${WRONG_FILES[@]}" >> /tmp/check-result
    exit 1
fi

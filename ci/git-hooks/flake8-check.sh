#!/bin/bash
#
# Copyright (c) Gabor Kapitany
#

set -euo pipefail

mapfile -t CHECK_FILES < <(find /workdir -not -path '*/.*' -type f -name "*.py")

flake8 --max-line-length 99 "${CHECK_FILES[@]}" > /tmp/check-result

#!/bin/bash
#
# Copyright (c) Gabor Kapitany
#

set -euo pipefail

mapfile -t CHECK_FILES < <(find /workdir -not -path '*/.*' -type f -name "*.py")

bandit --quiet --format screen "${CHECK_FILES[@]}" > /tmp/check-result

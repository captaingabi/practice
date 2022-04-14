#!/bin/bash
#
# Copyright (c) Gabor Kapitany
#

set -euo pipefail

git -c core.whitespace="trailing-space,space-before-tab" diff HEAD~1 --check --color > /tmp/check-result

#!/bin/bash
#
# Copyright (c) Gabor Kapitany
#

set -euo pipefail

cd /workdir/ci/ansible

ansible-lint --strict --nocolor > /tmp/check-result 2>&1

#!/bin/bash
#
# Copyright (c) Gabor Kapitany
#

set -euo pipefail

cd /workdir/ci/ansible

ansible-lint --nocolor > /tmp/check-result 2>&1

[[ "$(tail -n 1 /tmp/check-result)" == \
    'Passed with production profile: 0 failure(s), 0 warning(s)'* ]] \
    || exit 1

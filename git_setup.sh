#!/bin/bash
#
# Copyright (c) Gabor Kapitany
#

TOP_DIR="$(git rev-parse --show-toplevel)"

# install post-commit hook locally.
ln -s -f \
    "${TOP_DIR}"/ci/post-commit-hook.sh \
    "$(git rev-parse --git-dir)"/hooks/post-commit

echo "Done."

#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
pushd "${SCRIPT_DIR}/.." > /dev/null
git cliff > docs/changelog.md
code docs/changelog.md

read -r -p "Ready to publish? [y/N]: " response

if [[ "$response" =~ ^[Yy]$ ]]; then
    mkdocs gh-deploy
fi
git restore docs/changelog.md

popd > /dev/null
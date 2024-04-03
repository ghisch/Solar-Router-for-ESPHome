#!/bin/bash
SCRIPT_DIR=$(dirname "$0")
pushd ${SCRIPT_DIR}/.. > /dev/null
git cliff > docs/changelog.md
code docs/changelog.md
echo "Check changelog before publishing and hit enter (Ctrl+C to cancel)."
read a
mkdocs gh-deploy
git restore docs/changelog.md
popd > /dev/null
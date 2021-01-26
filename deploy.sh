#!/bin/sh

# If a command fails, stop the deployment
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project
hugo -t hugo-coder

cd public/seanchen1991.github.io

git add .

msg="rebuilding site $(date)"
if [ -n "$*" ]; then
    msg="$*"
fi
git commit -m "$msg"

git push origin main

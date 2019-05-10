#!/bin/bash
# Update Nextcloud server and apps from latest git master
# For local development environment
# Use from Nextcloud server folder with `./build/update.sh`

# Update server
printf "\n\033[1m${PWD##*/}\033[0m\n"
git checkout master
git pull --quiet
git --no-pager log -3 --pretty=format:"%h %Cblue%ar%x09%an %Creset%s"
printf "\n"
git branch --merged master | grep -v "master$" | xargs --no-run-if-empty git branch -d
git fetch --prune --quiet
git submodule update

# Update apps
source ./build/update-apps.sh

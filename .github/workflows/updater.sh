#!/bin/bash

#=================================================
# PACKAGE UPDATING HELPER
#=================================================

# This script is meant to be run by GitHub Actions
# The YunoHost-Apps organisation offers a template Action to run this script periodically
# Since each app is different, maintainers can adapt its contents so as to perform
# automatic actions when a new upstream release is detected.

#=================================================
# Update Go
#=================================================
go_url="https://go.dev/dl/?mode=json"

current_version=$(cat ../../manifest.toml | sed -n "s/\"https:\/\/go.dev\/dl\/go\(.*\).linux-amd64.tar.gz\"/\1/p" | cut -d'=' -f2)
go_version=$(curl --silent "$go_url" | jq -r '.[] | .version' | sort -V | tail -1)
go_arch=($(curl --silent "$go_url" | jq -r '.[] | select(.version=="'$go_version'") | .files[] | select(.os == "linux") | .arch'))

# Setting up the environment variables
echo "Current version: $current_version"
echo "Latest release from upstream: ${go_version#go}"
echo "VERSION=${go_version#go}" >> $GITHUB_ENV
# For the time being, let's assume the script will fail
echo "PROCEED=false" >> $GITHUB_ENV

# Proceed only if the retrieved version is greater than the current one
if ! dpkg --compare-versions "$current_version" "lt" "$go_version" ; then
    echo "::warning ::No new version available"
    exit 0
# Proceed only if a PR for this new version does not already exist
elif git ls-remote -q --exit-code --heads https://github.com/$GITHUB_REPOSITORY.git ci-auto-update-go-v$version ; then
    echo "::warning ::A branch already exists for this update"
    exit 0
fi

for arch in "${go_arch[@]}"
do
  filename=$(curl --silent "$go_url" | jq -r '.[] | select(.version=="'$go_version'") | .files[] | select(.os == "linux") | select(.arch == "'$arch'") | .filename')
  checksum=$(curl --silent "$go_url" | jq -r '.[] | select(.version=="'$go_version'") | .files[] | select(.os == "linux") | select(.arch == "'$arch'") | .sha256')
  case $arch in
    *"amd64"*)
      src="amd64"
      ;;
    *"386"*)
      src="i386"
      ;;
    *"arm64"*)
    src="arm64"
    ;;
    *"armv6l"*)
      src="arm"
      ;;
    *)
      src=""
      ;;
  esac

  if [ -z "$src" ]; then
    continue
  fi

  # Rewrite manifest.toml file
  sed -i "s/$src.url = \"https:\/\/go.dev.*/$src.url = \"https:\/\/go.dev\/dl\/$filename\"/g" manifest.toml
  sed -i "s/$src.sha256 = \".*/$src.sha256 = \"$checksum\"/g" manifest.toml

  echo "... resource go.$src updated"

done

#=================================================
# SPECIFIC UPDATE STEPS
#=================================================

# Any action on the app's source code can be done.
# The GitHub Action workflow takes care of committing all changes after this script ends.

#=================================================
# GENERIC FINALIZATION
#=================================================

# No need to update the README, yunohost-bot takes care of it

# The Action will proceed only if the PROCEED environment variable is set to true
echo "PROCEED=true" >> $GITHUB_ENV
exit 0
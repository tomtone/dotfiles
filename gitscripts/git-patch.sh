#!/bin/bash

# Erstes Argument: Dateiname (optional)
filename=${1:-}

# Zweites Argument: Ordner (optional)
patchfolder=$(git config patches.dir)
if [ -z "$2" ]; then
  if [ -z "$patchfolder" ]; then
    patchfolder="${GIT_PREFIX:-.}"
  else
    patchfolder="$patchfolder"
  fi
else
  patchfolder="$2"
fi

# Drittes Argument: Commit-Hash (optional)
commit=${3:-HEAD^}

# Wechsle ins richtige Verzeichnis und führe git format-patch aus
cd -- "${GIT_PREFIX:-.}"

if [ -z "$filename" ]; then
  git format-patch -n "$commit" -o "$patchfolder"
else
  output_file="$patchfolder/$filename.patch"
  git format-patch -n "$commit" > "$output_file" && echo "$output_file"
fi

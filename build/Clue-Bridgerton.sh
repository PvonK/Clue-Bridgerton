#!/bin/sh
printf '\033c\033]0;%s\a' Clue-Bridgerton
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Clue-Bridgerton.x86_64" "$@"

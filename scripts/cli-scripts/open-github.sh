#! /usr/bin/env bash
# open github page for current (top-level) repository
# Adapted from Sylvan Franklin:
# https://github.com/SylvanFranklin/.config/scripts/open-github.sh

# find repo root
git_root=$( git rev-parse --show-toplevel 2>/dev/null )
[[ -z "$git_root" ]] && echo "Not inside a git repository" && exit 1

url="$( git -C "$git_root" remote get-url origin )"

if [[ "$url" == *github.com* ]]; then
    if [[ "$url" == git@* ]]; then
        url="${url#git@}"           # remove "git@"
        url="https://${url/:/\/}"   # convert to https
    fi
    xdg-open "$url" || echo "No remote found: $url"
else
    echo "Repository not hosted on GitHub"
fi

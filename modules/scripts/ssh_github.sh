#! /usr/bin/env bash
# quick script for adding github ssh-key (temp until better solution implemented for startup/auto)

eval $(ssh-agent)
ssh-add $HOME/.ssh/github_ed25519

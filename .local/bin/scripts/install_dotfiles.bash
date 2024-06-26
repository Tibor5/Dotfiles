#!/usr/bin/env bash

git clone --bare git@github.com:Tibor5/Dotfiles.git "$HOME/Dotfiles"

function dot {
  /usr/bin/git --git-dir="$HOME/Dotfiles/" --work-tree="$HOME" "$@"
}

{
  if dot checkout; then
    echo "~~~~~ Checked out Dotfiles."
  else
    mkdir -p "$HOME/Dotfiles.bkp"
    echo "~~~~~ Backing up pre-existing Dotfiles."
    dot checkout 2>&1 | grep -E "\s+\." | awk \{'print $1'\} | xargs -I{} mv {} Dotfiles.bkp/{}
  fi
  dot checkout
  dot config status.showUntrackedFiles no
}

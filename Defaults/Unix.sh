#!/bin/sh

#
#  Copyright (C) 2015 Brian Speir. All rights reserved.
#
#  Licensed under The BSD 3-Clause License (the "License"); you may not
#  use this file except in compliance with the License. You may obtain
#  a copy of the License at http://opensource.org/licenses/BSD-3-Clause.
#
#

#  Unix.sh
#  Defaults
#
#  This script sets defaults for Mac OS X UNIX programs (Yosemite).
#


# -------------------------------------------------------------------- #
# Bash                                                                 #
# -------------------------------------------------------------------- #

# Create location.
mkdir -p "$HOME/Library/Preferences/Bash"
chmod 700 "$HOME/Library/Preferences/Bash"

# Link .bashrc to Preferences.
if [[ -h "$HOME/.bashrc" ]] || [[ ! -r "$HOME/.bashrc" ]]; then
    # Create a link to a placeholder file.
    touch "$HOME/Library/Preferences/Bash/bashrc"
    ln -fs "$HOME/Library/Preferences/Bash/bashrc" "$HOME/.bashrc"
    chmod -h 700 "$HOME/.bashrc"
elif [[ -r "$HOME/.bashrc" ]]; then
    # Move existing file and create link.
    mv "$HOME/.bashrc" "$HOME/Library/Preferences/Bash/bashrc"
    ln -fs "$HOME/Library/Preferences/Bash/bashrc" "$HOME/.bashrc"
    chmod -h 700 "$HOME/.bashrc"
fi

# Move .inputrc to Preferences. Location is set from variable INPUTRC.
if [[ -h "$HOME/.inputrc" ]] || [[ ! -r "$HOME/.inputrc" ]]; then
    # Remove links or create a placeholder file.
    rm "$HOME/.inputrc" &>/dev/null
    touch "$HOME/Library/Preferences/Bash/inputrc"
elif [[ -r "$HOME/.inputrc" ]]; then
    # Move existing file and create link.
    mv "$HOME/.inputrc" "$HOME/Library/Preferences/Bash/inputrc"
fi


# -------------------------------------------------------------------- #
# Git                                                                  #
# -------------------------------------------------------------------- #

# Create location.
mkdir -p "$HOME/Library/Preferences/Git/"
chmod 700 "$HOME/Library/Preferences/Git/"

# Link .gitconfig to Preferences.
if [[ -h "$HOME/.gitconfig" ]] || [[ ! -r "$HOME/.gitconfig" ]]; then
    # Create a link to a placeholder file.
    touch "$HOME/Library/Preferences/Git/config"
    ln -fs "$HOME/Library/Preferences/Git/config" "$HOME/.gitconfig"
    chmod -h 700 "$HOME/.gitconfig"
elif [[ -r "$HOME/.gitconfig" ]]; then
    # Move existing file and create link.
    mv "$HOME/.gitconfig" "$HOME/Library/Preferences/Git/config"
    ln -fs "$HOME/Library/Preferences/Git/config" "$HOME/.gitconfig"
    chmod -h 700 "$HOME/.gitconfig"
fi

# Move .gitignore to Preferences. Location is set in Git config.
if [[ -h "$HOME/.gitignore" ]] || [[ ! -r "$HOME/.gitignore" ]]; then
    # Remove links or create a placeholder file.
    rm "$HOME/.gitignore" &>/dev/null
    touch "$HOME/Library/Preferences/Git/ignore"
elif [[ -r "$HOME/.gitignore" ]]; then
    # Move existing file and create link.
    mv "$HOME/.gitignore" "$HOME/Library/Preferences/Git/ignore"
fi


# -------------------------------------------------------------------- #
# Mercurial                                                            #
# -------------------------------------------------------------------- #

# Create location.
mkdir -p "$HOME/Library/Preferences/Mercurial/"
chmod 700 "$HOME/Library/Preferences/Mercurial/"

# Link .hgrc to Preferences.
if [[ -h "$HOME/.hgrc" ]] || [[ ! -r "$HOME/.hgrc" ]]; then
    # Create a link to a placeholder file.
    touch "$HOME/Library/Preferences/Mercurial/config"
    ln -fs "$HOME/Library/Preferences/Mercurial/config" "$HOME/.hgrc"
    chmod -h 700 "$HOME/.hgrc"
elif [[ -r "$HOME/.hgrc" ]]; then
    # Move existing file and create link.
    mv "$HOME/.hgrc" "$HOME/Library/Preferences/Mercurial/config"
    ln -fs "$HOME/Library/Preferences/Mercurial/config" "$HOME/.hgrc"
    chmod -h 700 "$HOME/.hgrc"
fi

# Move .hgignore to Preferences. Location is set in Mercurial config.
if [[ -h "$HOME/.hgignore" ]] || [[ ! -r "$HOME/.hgignore" ]]; then
    # Remove links or create a placeholder file.
    rm "$HOME/.hgignore" &>/dev/null
    touch "$HOME/Library/Preferences/Mercurial/ignore"
elif [[ -r "$HOME/.hgignore" ]]; then
    # Move existing file and create link.
    mv "$HOME/.hgignore" "$HOME/Library/Preferences/Mercurial/ignore"
fi


# -------------------------------------------------------------------- #
# Shell                                                                #
# -------------------------------------------------------------------- #

# Create location.
mkdir -p "$HOME/Library/Shell"
chmod 700 "$HOME/Library/Shell"

# Relocate shell history to Library.
if [[ -h "$HOME/.bash_history" ]] || [[ ! -r "$HOME/.bash_history" ]]; then
    # Create a link to a placeholder file.
    rm "$HOME/.bash_history" &>/dev/null
    touch "$HOME/Library/Shell/history"
elif [[ -r "$HOME/.bash_history" ]]; then
    # Move existing file and create link.
    mv "$HOME/.bash_history" "$HOME/Library/Shell/history"
fi

# Create location.
mkdir -p "$HOME/Library/Preferences/Shell"
chmod 700 "$HOME/Library/Preferences/Shell"

# Link .profile to Preferences.
if [[ -h "$HOME/.profile" ]] || [[ ! -r "$HOME/.profile" ]]; then
    # Create a link to a placeholder file.
    touch "$HOME/Library/Preferences/Shell/profile"
    ln -fs "$HOME/Library/Preferences/Shell/profile" "$HOME/.profile"
    chmod -h 700 "$HOME/.profile"
elif [[ -r "$HOME/.profile" ]]; then
    # Move existing file and create link.
    mv "$HOME/.profile" "$HOME/Library/Preferences/Shell/profile"
    ln -fs "$HOME/Library/Preferences/Shell/profile" "$HOME/.profile"
    chmod -h 700 "$HOME/.profile"
fi

# Placeholder for additional shell files.
touch "$HOME/Library/Preferences/Shell/aliases"
touch "$HOME/Library/Preferences/Shell/paths"
touch "$HOME/Library/Preferences/Shell/private"
touch "$HOME/Library/Preferences/Shell/sources"


# -------------------------------------------------------------------- #
# SSH                                                                  #
# -------------------------------------------------------------------- #

# Create location.
mkdir -p "$HOME/Library/SSH"
chmod 700 "$HOME/Library/SSH"

# Link .ssh to Library.
if [[ -h "$HOME/.ssh" ]] || [[ ! -r "$HOME/.ssh" ]]; then
    # Create a link to a placeholder file.
    touch "$HOME/Library/SSH"
    ln -fhs "$HOME/Library/SSH" "$HOME/.ssh"
    chmod -h 700 "$HOME/.ssh"
elif [[ -d "$HOME/.ssh" ]]; then
    # Move existing file and create link.
    mv "$HOME/.ssh" "$HOME/Library/SSH"
    ln -fhs "$HOME/Library/SSH" "$HOME/.ssh"
    chmod -h 700 "$HOME/.ssh"
fi

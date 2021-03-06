#!/bin/sh

#
#  Copyright (C) 2013-2015 Brian Speir. All rights reserved.
#
#  Licensed under The BSD 3-Clause License (the "License"); you may not
#  use this file except in compliance with the License. You may obtain
#  a copy of the License at http://opensource.org/licenses/BSD-3-Clause.
#
#

#  SourceTree.sh v1.0.1
#  Defaults
#
#  This script sets defaults for SourceTree (1.6.x).
#


# Dependencies ------------------------------------------------------------- #

# Install Source Code Pro fonts.
if [[ ! -r "$HOME/Library/Fonts/SourceCodePro-Regular.otf" ]]; then
    bash <(curl -s https://raw.github.com/brianspeir/Bundles/master/Fonts.install)
fi

# General ------------------------------------------------------------------ #

# Do not allow SourceTree to modify your global Mercurial and Git configuration files
defaults write com.torusknot.SourceTreeNotMAS agreedToUpdateConfig -bool NO

# Set the default project folder.
defaults write com.torusknot.SourceTreeNotMAS defaultFolder -string "$HOME/Projects"

# Use fixed-width font for commit messages
defaults write com.torusknot.SourceTreeNotMAS useFixedWithCommitFont -bool YES

# Diff --------------------------------------------------------------------- #

# Set Diff View font and size
defaults write com.torusknot.SourceTreeNotMAS diffFontName -string "SourceCodePro-Regular"
defaults write com.torusknot.SourceTreeNotMAS diffFontSize -int 12.000000

# Mercurial ---------------------------------------------------------------- #

# Set Mercurial global ignore file.
defaults write com.torusknot.SourceTreeNotMAS mercurialGlobalIgnoreFile -string "$HOME/Library/Application Support/Mercurial/global.hgignore"

# Git ---------------------------------------------------------------------- #

# Set Git global ignore file.
defaults write com.torusknot.SourceTreeNotMAS gitGlobalIgnoreFile -string "$HOME/Library/Application Support/Git/global.gitignore"

# Stage files on double click.
defaults write com.torusknot.SourceTreeNotMAS fileDoubleClickBehaviour -bool YES

# Use system git
defaults write com.torusknot.SourceTreeNotMAS gitWhichOne -int 1
defaults write com.torusknot.SourceTreeNotMAS gitCustomPath -string /usr/bin/git

# Update ------------------------------------------------------------------- #

# Disable automatic check for updates
defaults write com.torusknot.SourceTreeNotMAS SUEnableAutomaticChecks -bool NO

# Other -------------------------------------------------------------------- #

defaults write com.torusknot.SourceTreeNotMAS agreedToEULA -bool YES

# Open the bookmarks window on launch
defaults write com.torusknot.SourceTreeNotMAS bookmarksWindowOpen -bool YES

# Do not reopen project windows at startup.
defaults write com.torusknot.SourceTreeNotMAS reopenWindowsAtStartup -bool NO

#!/bin/sh

#
#  Copyright (C) 2014 Brian Speir. All rights reserved.
#
#  Licensed under The BSD 3-Clause License (the "License"); you may not
#  use this file except in compliance with the License. You may obtain
#  a copy of the License at http://opensource.org/licenses/BSD-3-Clause.
#
#

#
#  Terminal.sh
#  Defaults
#
#  This script sets defaults for Mac OS X Terminal (Yosemite).
#


# Dependencies ------------------------------------------------------------- #

# Install Source Code Pro fonts.
if [[ ! -r "$HOME/Library/Fonts/SourceCodePro-Regular.otf" ]]; then
    sh <(curl -s https://raw.githubusercontent.com/brianspeir/Bundles/master/Bundles/Fonts.sh)
fi


# Variables ---------------------------------------------------------------- #

SOURCE="https://raw.githubusercontent.com/brianspeir/Defaults/master/Defaults/Resources/TerminalProfiles"

DEFAULT_WINDOW="Crayons"


# General ------------------------------------------------------------------ #

# On startup, open new window with profile:
defaults write com.apple.Terminal "Startup Window Settings" -string "$DEFAULT_WINDOW"


# Profiles ----------------------------------------------------------------- #

# Remove Default Profiles.
defaults write com.apple.Terminal "Window Settings" -dict && sleep 1

# *** defaults beyond this point will cause preferences to reset ***

# Create temporary download folder.
TMPFILE=$(mktemp -d "$TMPDIR"tmp.XXXXXXXX)

# Import Profile Crayons.
curl -s $SOURCE/Crayons.terminal -o $TMPFILE/Crayons.terminal
/usr/libexec/PlistBuddy -c "Add ':Window Settings:Crayons' dict" "$HOME/Library/Preferences/com.apple.Terminal.plist" && sleep 1
/usr/libexec/PlistBuddy -c "Merge $TMPFILE/Crayons.terminal ':Window Settings:Crayons'" "$HOME/Library/Preferences/com.apple.Terminal.plist" && sleep 1

# Import Profile Glass.
curl -s $SOURCE/Glass.terminal -o $TMPFILE/Glass.terminal
/usr/libexec/PlistBuddy -c "Add ':Window Settings:Glass' dict" "$HOME/Library/Preferences/com.apple.Terminal.plist" && sleep 1
/usr/libexec/PlistBuddy -c "Merge $TMPFILE/Glass.terminal ':Window Settings:Glass'" "$HOME/Library/Preferences/com.apple.Terminal.plist" && sleep 1

# Import Profile Lead.
curl -s $SOURCE/Lead.terminal -o $TMPFILE/Lead.terminal
/usr/libexec/PlistBuddy -c "Add ':Window Settings:Lead' dict" "$HOME/Library/Preferences/com.apple.Terminal.plist" && sleep 1
/usr/libexec/PlistBuddy -c "Merge $TMPFILE/Lead.terminal ':Window Settings:Lead'" "$HOME/Library/Preferences/com.apple.Terminal.plist" && sleep 1

# Import Profile Notes.
curl -s $SOURCE/Notes.terminal -o $TMPFILE/Notes.terminal
/usr/libexec/PlistBuddy -c "Add ':Window Settings:Notes' dict" "$HOME/Library/Preferences/com.apple.Terminal.plist" && sleep 1
/usr/libexec/PlistBuddy -c "Merge $TMPFILE/Notes.terminal ':Window Settings:Notes'" "$HOME/Library/Preferences/com.apple.Terminal.plist" && sleep 1

# Import Profile Strawberry.
curl -s $SOURCE/Strawberry.terminal -o $TMPFILE/Strawberry.terminal
/usr/libexec/PlistBuddy -c "Add ':Window Settings:Strawberry' dict" "$HOME/Library/Preferences/com.apple.Terminal.plist" && sleep 1
/usr/libexec/PlistBuddy -c "Merge $TMPFILE/Strawberry.terminal ':Window Settings:Strawberry'" "$HOME/Library/Preferences/com.apple.Terminal.plist" && sleep 1

# Import Profile Carnation.
curl -s $SOURCE/Carnation.terminal -o $TMPFILE/Carnation.terminal
/usr/libexec/PlistBuddy -c "Add ':Window Settings:Carnation' dict" "$HOME/Library/Preferences/com.apple.Terminal.plist" && sleep 1
/usr/libexec/PlistBuddy -c "Merge $TMPFILE/Carnation.terminal ':Window Settings:Carnation'" "$HOME/Library/Preferences/com.apple.Terminal.plist" && sleep 1

# Remove temporary download folder.
rm -r $TMPFILE

# Default profile:
defaults write com.apple.Terminal "Default Window Settings" -string "$DEFAULT_WINDOW"


# Window Groups ------------------------------------------------------------ #


# Encodings ---------------------------------------------------------------- #


# Other -------------------------------------------------------------------- #

# Enable Secure Keyboard Entry.
defaults write com.apple.Terminal SecureKeyboardEntry -bool YES

# Set man page window setting:
defaults write com.apple.Terminal "Man Page Window Settings" -string "Notes"

#!/bin/bash
#

# Quicken.defaults v1.0.0
# This script sets defaults for Quicken Essentials.
# www.brianspeir.com
#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License. You may not use this file except
# in compliance with the License. You may obtain a copy of the License at
# http://opensource.org/licenses/BSD-3-Clause


# General ------------------------------------------------------------------ #

# Do not clean up payees automatically.
defaults write com.intuit.QuickenEssentials ApplyACEPayees -bool NO

# Apply categories and tags automatically.
defaults write com.intuit.QuickenEssentials ApplyHistoricAutoCategorization -bool YES

# If no previously-entered category or tag was found, Quicken shoud do nothing.
defaults write com.intuit.QuickenEssentials ACEOptInStatus -int 2

# Other -------------------------------------------------------------------- #

# Don't ask.
defaults write com.intuit.QuickenEssentials DidAcceptLicense -bool YES

# Do not check for new updates automatically.
defaults write com.intuit.QuickenEssentials SUEnableAutomaticChecks -bool NO

# Do not save recent files.
/usr/libexec/PlistBuddy -c "Delete :RecentDocuments:CustomListItems" $HOME/Library/Preferences/com.intuit.QuickenEssentials.LSSharedFileList.plist  &>/dev/null
/usr/libexec/PlistBuddy -c "Add :RecentDocuments:MaxAmount integer" $HOME/Library/Preferences/com.intuit.QuickenEssentials.LSSharedFileList.plist  &>/dev/null
/usr/libexec/PlistBuddy -c "Set :RecentDocuments:MaxAmount 0" $HOME/Library/Preferences/com.intuit.QuickenEssentials.LSSharedFileList.plist

#!/bin/bash
#

# Utilities.defaults v1.0.0
# This script sets defaults for Mac OS X Utility Apps (Mountain Lion).
# www.brianspeir.com
#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License. You may not use this file except
# in compliance with the License. You may obtain a copy of the License at
# http://opensource.org/licenses/BSD-3-Clause


# -------------------------------------------------------------------------- #
# AirPort Utility                                                            #
# -------------------------------------------------------------------------- #

# Do not check for updates when opening AirPort Utility
defaults write com.apple.airport.airportutility dontCheckForUpdates -bool YES

# Do not check for updates automaically...
defaults -currentHost write com.apple.airport.agent monitorUpdates -bool NO

# Do not monitor AirPort base stations for problems.
defaults -currentHost write com.apple.airport.agent monitorProblems -bool NO
defaults -currentHost write com.apple.airport.agent monitorFiltered -bool NO

# -------------------------------------------------------------------------- #
# Disk Utility                                                               #
# -------------------------------------------------------------------------- #

# Show Debug menu in menu bar.
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool YES

# Enable advanced images formats for image convert.
defaults write com.apple.DiskUtility advanced-image-options -bool YES


# -------------------------------------------------------------------------- #
# Keychain Access                                                            #
# -------------------------------------------------------------------------- #

# Show keychain status and lock screen in menu bar.
/usr/libexec/PlistBuddy -c "Add :menuExtras:0 string '/Applications/Utilities/Keychain Access.app/Contents/Resources/Keychain.menu'" $HOME/Library/Preferences/com.apple.systemuiserver.plist &>/dev/null
killall SystemUIServer
for (( i = 0; i < 10; i++ )); do
    echo -n "####" ; sleep 1
    echo -n "####" ; sleep 1
done
echo ""

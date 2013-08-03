#!/bin/bash
#

# Messages.defaults v1.0.0
# This script sets defaults for Mac OS X Messages (Mountain Lion).
# www.brianspeir.com
#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License. You may not use this file except
# in compliance with the License. You may obtain a copy of the License at
# http://opensource.org/licenses/BSD-3-Clause


# Accounts ----------------------------------------------------------------- #

cat >> "$HOME/Desktop/More Defaults.txt" <<'EOM'
Choose Messages > Preferences > Accounts
  - Add Facebook chat through Jabber.
  - Choose Jabber for "Account Type."
  - Enter <your Facebook username>@chat.facebook.com for "Account Name."
  - Enter <your Facebook password> for "Password."

Choose Messages > Preferences > Accounts > Facebook > Chat Settings.
  - Deselect the option "Use my computer name."

EOM

# Messages ----------------------------------------------------------------- #

# Save history when conversations are closed.
defaults write com.apple.iChat SaveConversationsOnClose -bool YES

# Messages ----------------------------------------------------------------- #

# Do not open Messages when external camera is turned on.
/usr/libexec/PlistBuddy -c "Add :com.apple.digihub.dvcamera.IIDC.appeared:action integer" $HOME/Library/Preferences/com.apple.digihub.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Set :com.apple.digihub.dvcamera.IIDC.appeared:action 1" $HOME/Library/Preferences/com.apple.digihub.plist
/usr/libexec/PlistBuddy -c "Add :com.apple.digihub.dvcamera.IIDC.irisopened:action integer" $HOME/Library/Preferences/com.apple.digihub.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Set :com.apple.digihub.dvcamera.IIDC.irisopened:action 1" $HOME/Library/Preferences/com.apple.digihub.plist

# Other -------------------------------------------------------------------- #

# Allow different status per account.
defaults write com.apple.iChat AllowStatusPerAccount -bool YES

# Disable screen sharing.
defaults write com.apple.imagent Setting.BlockARDAvail -int 1

# Enable data detectors
defaults write com.apple.iChat EnableDataDetectors -int 1

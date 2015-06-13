#!/bin/bash
#

# Mail.defaults v1.0.0
# This script sets defaults for Mac OS X Mail (Mountain Lion).
# www.brianspeir.com
#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License. You may not use this file except
# in compliance with the License. You may obtain a copy of the License at
# http://opensource.org/licenses/BSD-3-Clause


# General ------------------------------------------------------------------ #

# Check for new messages every minute.
defaults write com.apple.mail PollTime -int 1

# Add invitations to Calendar automatically.
defaults write com.apple.mail AddInvitationsToICalAutomatically -bool Yes

# If outgoing server is unavailable automatically try sending later.
defaults write com.apple.mail SuppressDeliveryFailure -int 1

# When searching all mailboxes, include results from Trash & Junk.
defaults write com.apple.mail IndexJunk -bool Yes
defaults write com.apple.mail IndexTrash -bool Yes

# Do not show online buddy status.
defaults write com.apple.mail ShowPresence -bool No

# When sending to a group, do not show all memeber addresses
defaults write com.apple.mail ExpandPrivateAliases -bool No

# Do not include name when copying email addresses
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool No

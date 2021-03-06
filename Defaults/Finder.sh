#!/bin/bash
#

# Finder.defaults v1.0.0
# This script sets defaults for the Finder (Mountain Lion).
# www.brianspeir.com
#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License. You may not use this file except
# in compliance with the License. You may obtain a copy of the License at
# http://opensource.org/licenses/BSD-3-Clause


# General ------------------------------------------------------------------ #

# New Finder windows show home.
defaults write com.apple.finder NewWindowTarget -string PfHm

# Sidebar ------------------------------------------------------------------ #

# Setup sidebar items through the Finder > Preferences... No easy way to target the arrays and UIDs.
cat >> "$HOME/Desktop/More Defaults.txt" <<'EOM'
Choose Finder > Preferences > Sidebar
  - Deslect "All My Files," "Desktop," "Movies," "Music,"
    "Back to My Mac" and "Remote Disk."
  - Select "Hard Disks."

Add the "Projects" folder to sidebar.

EOM

# Advanced ----------------------------------------------------------------- #

# Force Secure Empty Trash...
defaults write com.apple.finder EmptyTrashSecurely -bool YES

# When performing a search, search the current folder.
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Other -------------------------------------------------------------------- #

# Change the Finder view...
# as List = "Nlsv | as Icon = "icnv" |  Columns = "clmvas" | as Cover Flow = "Flwv"
# defaults write com.apple.Finder FXPreferredViewStyle -string "icnv"

# Enable text selection in Quick Look.
defaults write com.apple.finder QLEnableTextSelection -bool YES

# Expand Save... panel.
defaults write -g NSNavPanelExpandedStateForSaveMode -bool YES

# Show Details in Print… panel.
defaults write -g PMPrintingExpandedStateForPrint2 -bool YES

# Close printe queue when finised.
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool YES

# Prevent .DS_Store file creation over network connections.
defaults write com.apple.desktopservices DSDontWriteNetworkStores YES

# Disable AirDrop
sudo defaults write /Library/Preferences/com.apple.NetworkBrowser DisableAirDrop -bool YES

# Do not reopen windows when logging back in.
defaults write com.apple.loginwindow TALLogoutSavesState -bool NO

# Clear the Launchpad.
rm $HOME/Library/Application\ Support/Dock/*.db && killall Dock
for (( i = 0; i < 5; i++ )); do
    echo -n "########" ; sleep 1
    echo -n "########" ; sleep 1
done
echo ""
sqlite3 $HOME/Library/Application\ Support/Dock/*.db "DELETE FROM apps; DELETE FROM groups WHERE rowid>2; DELETE FROM items WHERE rowid>4; DELETE FROM widgets;" && Killall Dock

# Remove the User Information folder
rm "/User Information" &>/dev/null

# Quit the Finder.
killall Finder

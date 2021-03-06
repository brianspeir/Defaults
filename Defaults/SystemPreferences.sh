#!/bin/bash
#

# SystemPreferences.defaults v1.0.0
# This script sets defaults for Mac OS X System Preferences (Mountain Lion).
# www.brianspeir.com
#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License. You may not use this file except
# in compliance with the License. You may obtain a copy of the License at
# http://opensource.org/licenses/BSD-3-Clause


# Extend the password time stamp.
sudo -v

# ========================================================================== #
# Variables                                                                  #
# ========================================================================== #

# Computer serial number.
COMPUTER_SERIAL_NUMBER="$(system_profiler SPHardwareDataType | awk '/Serial Number/ { print $4 }')"

# Computer MAC address.
COMPUTER_MAC_ADDRESS="$(system_profiler SPNetworkDataType | awk '/MAC Address/ { print $3 }' | sed 's/://g')"

# Hard disk capacity.
DISK_CAPACITY="$(system_profiler SPStorageDataType | awk '/Capacity/ { if (NR<14) print $4 }' | sed 's/[^[:digit:]]//g')"

# Default computer name. (if variable not previously assigned)
if [[ -z "$COMPUTER_NAME" ]]; then
    COMPUTER_NAME="Macintosh $COMPUTER_SERIAL_NUMBER"
fi

# Set host name variable from computer name.
HOST_NAME="$(echo "$COMPUTER_NAME" | sed 's/[^[:alnum:][:space:]-]//g;s/^[ \t]*//;s/[ \t]*$//;s/  */-/g' | tr "[:upper:]" "[:lower:]")"

# Default Time Machine Backup Disk size limit. (if variable not previously assigned)
if [[ -z "$MAX_BACKUP_SIZE" ]]; then
    MAX_BACKUP_SIZE="$(echo "scale=0; ($DISK_CAPACITY*1.5)/1" | bc -l)"
fi

# Variable to fix problem where "Wi-FI is not a Wi-Fi interface". (original source unknown)
HARDWAREPORT_WI_FI="$(networksetup -listallhardwareports | grep -A 1 "Wi-Fi" | grep Device | cut -c 9-12)"

# ========================================================================== #
# General                                                                    #
# ========================================================================== #

# Appearance color for Buttons, Menues, and Windows.
# Blue appearance = 1 | Graphite appearance = 6
defaults write -g AppleAquaColorVariant -int 1

# Highlight color. (from the crayons picker)
# Cayenne = "0.501961 0.000000 0.000000"    | Asparagus = "0.501961 0.501961 0.000000"
# Clover = "0.000000 0.501961 0.000000"     | Teal = "0.000000 0.501961 0.501961"
# Midnight = "0.000000 0.000000 0.501961"   | Plum = "0.501961 0.000000 0.501961"
# Tin = "0.498039 0.498039 0.498039"        | Nickel = "0.501961 0.501961 0.501961"
# Mocha = "0.501961 0.250980 0.000000"      | Fern = "0.250980 0.501961 0.000000"
# Moss = "0.000000 0.501961 0.250980"       | Ocean = "0.000000 0.250980 0.501961"
# Eggplant = "0.250980 0.000000 0.501961"   | Maroon = "0.501961 0.000000 0.250980"
# Steel = "0.400000 0.400000 0.400000"      | Aluminum = "0.600000 0.600000 0.600000"
# Maraschino = "1.000000 0.000000 0.000000" | Lemon = "1.000000 1.000000 0.000000"
# Spring = "0.000000 1.000000 0.000000"     | Turquoise = "0.000000 1.000000 1.000000"
# Blueberry = "0.000000 0.000000 1.000000"  | Magenta = "1.000000 0.000000 1.000000"
# Iron = "0.298039 0.298039 0.298039"       | Magnesium = "0.701961 0.701961 0.701961"
# Tangerine = "1.000000 0.501961 0.000000"  | Lime = "0.501961 1.000000 0.000000"
# Sea Foam = "0.000000 1.000000 0.501961"   | Aqua = "0.000000 0.501961 1.000000"
# Grape = "0.501961 0.000000 1.000000"      | Strawberry = "1.000000 0.000000 0.501961"
# Tungsten = "0.200000 0.200000 0.200000"   | Silver = "0.800000 0.800000 0.800000"
# Salmon = "1.000000 0.400000 0.400000"     | Banana = "1.000000 1.000000 0.400000"
# Flora = "0.400000 1.000000 0.400000"      | Ice = "0.400000 1.000000 1.000000"
# Orchid = "0.400000 0.400000 1.000000"     | Bubblegum = "1.000000 0.400000 1.000000"
# Lead = "0.0980392 0.0980392 0.0980392"    | Mercery = "0.901961 0.901961 0.901961"
# Cantaloupe = "1.000000 0.800000 0.400000" | Honeydew = "0.800000 1.000000 0.400000"
# Spindrift = "0.400000 1.000000 0.800000"  | Sky = "0.400000 0.800000 1.000000"
# Lavender = "0.800000 0.400000 1.000000"   | Carnation = "1.000000 0.435294 0.811765"
# Licorice = "0.000000 0.000000 0.000000"   | Snow = "1.000000 1.000000 1.000000"
defaults write -g AppleHighlightColor -string "1.000000 0.800000 0.400000"
defaults write com.apple.systempreferences AppleOtherHighlightColor -string "1.000000 0.800000 0.400000"

# Ask to keep changes when closing documents.
defaults write -g NSCloseAlwaysConfirmsChanges -bool YES

# Do not close windows when quitting an application.
defaults write -g NSQuitAlwaysKeepsWindows -bool NO
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool NO

# Recent items for Hosts, Apps, Documents, and Servers (not all apps respect this value)
    # TODO not reflecting changes in System Preferences
    defaults write com.apple.recentitems Hosts -dict MaxAmount 0
    defaults write com.apple.recentitems RecentApplications -dict MaxAmount 0
    defaults write com.apple.recentitems RecentDocuments -dict MaxAmount 0
    defaults write com.apple.recentitems RecentServers -dict MaxAmount 0

    # recent documents limit
    defaults write -g NSRecentDocumentsLimit -int 0

    # recent places
    defaults write -g NSNavRecentPlacesLimit -int 0

    # Number of recent items: Applications: None
    osascript -e 'tell application "System Events" to tell appearance preferences to set recent applications limit to 0'

    # Number of recent items: Documents: None
    osascript -e 'tell application "System Events" to tell appearance preferences to set recent documents limit to 0'

    # Number of recent items: Servers: None
    osascript -e 'tell application "System Events" to tell appearance preferences to set recent servers limit to 0'


# ========================================================================== #
# Desktop & Screen Saver                                                     #
# ========================================================================== #

# Desktop ------------------------------------------------------------------ #

# Set some menu extras. (remove volume, clock, bluetoogh & user)
defaults write com.apple.systemuiserver menuExtras -array \
    '/System/Library/CoreServices/Menu Extras/TimeMachine.menu' \
    '/System/Library/CoreServices/Menu Extras/AirPort.menu' \
    '/System/Library/CoreServices/Menu Extras/Battery.menu'

# Set a clear slate for the removals below... (prevents duplicates)
defaults -currentHost delete com.apple.systemuiserver dontAutoLoad &>/dev/null

# Screen Saver ------------------------------------------------------------- #

# Set screen saver start time. (value in seconds)
sudo defaults -currentHost write com.apple.screensaver idleTime -int 1200


# ========================================================================== #
# Dock                                                                       #
# ========================================================================== #

# Enable magnification.
defaults write com.apple.dock magnification -bool YES

# Minimize windows into application icon.
defaults write com.apple.dock minimize-to-application -bool YES

# Automatically hide and show the Dock.
defaults write com.apple.dock autohide -bool YES

# Show indicator lights for open applications.
defaults write com.apple.dock show-process-indicators -bool YES

# Other -------------------------------------------------------------------- #

# Hide inactive apps in the Dock.
# defaults write com.apple.dock static-only -bool TRUE

# Use Stacks new list view.
defaults write com.apple.dock use-new-list-stack -bool YES


# ========================================================================== #
# Mission Control                                                            #
# ========================================================================== #

# Do not show Dashboard as a space.
defaults write com.apple.dock dashboard-in-overlay -bool YES

# Do not automatically rearrange spaces based on most recent use.
defaults write com.apple.dock mru-spaces -bool NO

# When switching to an applicaiton,
# do not switch to a space with open windows for the application.
defaults write -g AppleSpacesSwitchOnActivate -bool YES

# Do not group windows by Applicaiton.
defaults write com.apple.dock expose-group-by-app -bool NO

# Mission Control keyboard and mouse shortcuts.
# TODO

# Appplication windows keyboard and mouse shortcuts.
# TODO

# Show desktop keyboard and mouse shortcuts.
# TODO

# Show dashboard keyboard and mouse shortcuts.
# TODO

# Hot corcers... ----------------------------------------------------------- #
# (disabled) = 1/1,048,576  |  Put Display to Sleep = 10/0  |  Launchpad = 11/0
# Mission Control = 2/0     |  Applications Windows = 3/0   |  Desktop = 4/0
# Dashboard = 7/0           |  Notification Center = 12/0
# Start Screen Saver = 5/0  |  Disable Screen Saver = 6/0

# Set top left active screen corner.
defaults write com.apple.dock wvous-tl-corner -int 1
defaults write com.apple.dock wvous-tl-modifier -int 1,048,576

# Set top right active screen corner.
defaults write com.apple.dock wvous-tr-corner -int 1
defaults write com.apple.dock wvous-tr-modifier -int 1,048,576

# Set bottom left active screen corner.
defaults write com.apple.dock wvous-bl-corner -int 1
defaults write com.apple.dock wvous-bl-modifier -int 1,048,576

# Set bottom right active screen corner.
defaults write com.apple.dock wvous-br-corner -int 1
defaults write com.apple.dock wvous-br-modifier -int 1,048,576

# Other -------------------------------------------------------------------- #

# Disable Dashboard.
defaults write com.apple.dashboard mcx-disabled -bool YES

# Remove widgets.
rm $HOME/Library/Preferences/widget-com.apple.widget.*.plist &>/dev/null


# ========================================================================== #
# Language & Text                                                            #
# ========================================================================== #

# Language ----------------------------------------------------------------- #

# Set language.
sudo languagesetup -langspec English &>/dev/null
defaults write -g AppleLanguages -array "en"
sudo defaults write /Library/Preferences/.GlobalPreferences AppleLanguages -array "en"
defaults write com.apple.systempreferences AvailableLanguages -array "en"

# Text --------------------------------------------------------------------- #

# Spelling language:
defaults write -g NSPreferredSpellServerLanguage -string "en"

# Region ------------------------------------------------------------------- #

# Set region to United States.
defaults write -g AppleLocale -string "en_US"
sudo defaults write /Library/Preferences/.GlobalPreferences AppleLocale -string "en_US"

# Set short date to international format.
/usr/libexec/PlistBuddy -c "Add :AppleICUDateFormatStrings:1 string" $HOME/Library/Preferences/.GlobalPreferences.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Set :AppleICUDateFormatStrings:1 'yyyy-MM-dd'" $HOME/Library/Preferences/.GlobalPreferences.plist

# Set times to 24-hour.
/usr/libexec/PlistBuddy -c "Add :AppleICUTimeFormatStrings:1 string" $HOME/Library/Preferences/.GlobalPreferences.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Set :AppleICUTimeFormatStrings:1 'HH:mm'" $HOME/Library/Preferences/.GlobalPreferences.plist
/usr/libexec/PlistBuddy -c "Add :AppleICUTimeFormatStrings:2 string" $HOME/Library/Preferences/.GlobalPreferences.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Set :AppleICUTimeFormatStrings:2 'HH:mm:ss'" $HOME/Library/Preferences/.GlobalPreferences.plist
/usr/libexec/PlistBuddy -c "Add :AppleICUTimeFormatStrings:3 string" $HOME/Library/Preferences/.GlobalPreferences.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Set :AppleICUTimeFormatStrings:3 'HH:mm:ss z'" $HOME/Library/Preferences/.GlobalPreferences.plist
/usr/libexec/PlistBuddy -c "Add :AppleICUTimeFormatStrings:4 string" $HOME/Library/Preferences/.GlobalPreferences.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Set :AppleICUTimeFormatStrings:4 'HH:mm:ss zzzz'" $HOME/Library/Preferences/.GlobalPreferences.plist

# Set menu bar Clock to use a 24-hour clock.
defaults write com.apple.menuextra.clock DateFormat -string "EEE H:mm"

# Set measurement units to standard.
defaults write -g AppleMeasurementUnits -string "Inches"
defaults write -g AppleMetricUnits -bool NO


# ========================================================================== #
# Security & Privacy                                                         #
# ========================================================================== #

# General ------------------------------------------------------------------ #

# Require password [value in seconds] after sleep or screen saver begins.
# immediately | 5 seconds | 1 minute | 5 minutes | 15 minutes | 1 hour | 4 hours
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0.0000000000000000

# Set a message to appear on the login screen.
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText -string "Get your own Mac..."

# Disable automatic login.
sudo defaults delete /Library/Preferences/com.apple.loginwindow autoLoginUser &>/dev/null
sudo rm /etc/kcpassword  &>/dev/null

# Allow applications downloaded from.
# Mac App Store | Mac App Store and identified developers (enabled) | Anywhere (disabled)
# spctl --disable --label "Mac App Store"
# TODO

# Advanced... -------------------------------------------------------------- #

# Log out after [value in seconds] minutes of inactivity.
# sudo defaults write /Library/Preferences/.GlobalPreferences com.apple.autologout.AutoLogOutDelay -int 3600
# sudo defaults write /Library/Preferences/.GlobalPreferences com.apple.securitypref.logoutvalue -int 3600

# Require an administrator password to access locked preferences.
sudo /usr/libexec/PlistBuddy -c "Set :rights:system.preferences:shared NO" /etc/authorization

# Automatically update safe downloads list.
# (enabled by default)

# Disable remote control infrared receiver.
sudo defaults write /Library/Preferences/com.apple.driver.AppleIRController DeviceEnabled -bool NO

# FileVault ---------------------------------------------------------------- #

  # Other ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

  # Destroy File Vault Key when going to standby mode.
  sudo pmset -a destroyfvkeyonstandby 1

# Firewall ----------------------------------------------------------------- #

# Create a link to make firewall configuration easier.
sudo ln -fs "/usr/libexec/ApplicationFirewall/socketfilterfw" "/usr/sbin/socketfilterfw"

# Turn on firewall.
socketfilterfw --setglobalstate on  &>/dev/null

  # Firewall Options... ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

  # Block all non-essential incoming connections.
  # socketfilterfw --setblockall on

  # Do not automatically allow signed software to receive incoming connections.
  socketfilterfw --setallowsigned off &>/dev/null

  # Enable stealth mode.
  socketfilterfw --setstealthmode on &>/dev/null

# Other -------------------------------------------------------------------- #

# Enable firewall log mode.
socketfilterfw --setloggingmode on &>/dev/null

# Privacy ------------------------------------------------------------------ #

# Disable location services.
defaults write com.apple.MCX DisableLocationServices -bool YES

# Do not send diagnostic & usage data to Apple
defaults -currentHost write com.apple.SubmitDiagInfo AutoSubmit -bool NO

# ========================================================================== #
# Spotlight                                                                  #
# ========================================================================== #

# Hide categories or change the order in which results appear.
# It's not pretty but it correctly types the enabled key. Still better than PlistBuddy.
defaults write com.apple.spotlight orderedItems -array \
    '<dict><key>enabled</key><false/><key>name</key><string>APPLICATIONS</string></dict>' \
    '<dict><key>enabled</key><false/><key>name</key><string>SYSTEM_PREFS</string></dict>' \
    '<dict><key>enabled</key><true/><key>name</key><string>DOCUMENTS</string></dict>' \
    '<dict><key>enabled</key><true/><key>name</key><string>PDF</string></dict>' \
    '<dict><key>enabled</key><true/><key>name</key><string>PRESENTATIONS</string></dict>' \
    '<dict><key>enabled</key><true/><key>name</key><string>SPREADSHEETS</string></dict>' \
    '<dict><key>enabled</key><true/><key>name</key><string>DIRECTORIES</string></dict>' \
    '<dict><key>enabled</key><true/><key>name</key><string>MESSAGES</string></dict>' \
    '<dict><key>enabled</key><true/><key>name</key><string>CONTACT</string></dict>' \
    '<dict><key>enabled</key><true/><key>name</key><string>EVENT_TODO</string></dict>' \
    '<dict><key>enabled</key><false/><key>name</key><string>IMAGES</string></dict>' \
    '<dict><key>enabled</key><false/><key>name</key><string>BOOKMARKS</string></dict>' \
    '<dict><key>enabled</key><false/><key>name</key><string>MUSIC</string></dict>' \
    '<dict><key>enabled</key><false/><key>name</key><string>MOVIES</string></dict>' \
    '<dict><key>enabled</key><false/><key>name</key><string>FONTS</string></dict>' \
    '<dict><key>enabled</key><true/><key>name</key><string>SOURCE</string></dict>'

# Other -------------------------------------------------------------------- #

# Disable dictionary look up in Spotlight
# defaults write com.apple.spotlight DictionaryLookupEnabled -bool NO

# Disable calculation in Spotlight.
# defaults write com.apple.spotlight CalculationEnabled -bool NO


# ========================================================================== #
# Notifications                                                              #
# ========================================================================== #

# Disable Notifications
# defaults write /System/Library/LaunchAgents/com.apple.notificationscenterui


# ========================================================================== #
# CDs & DVDs                                                                 #
# ========================================================================== #

# Ignore = 1                        |  Ask what to do = 2
# Open Finder = 100                 |  Open iTunes = 101
# Open Disk Utility = 102           |  Open iDVD (DVD only) = 106

# Disable blank CD automatic action.
/usr/libexec/PlistBuddy -c "Add :com.apple.digihub.blank.cd.appeared:action integer" $HOME/Library/Preferences/com.apple.digihub.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Set :com.apple.digihub.blank.cd.appeared:action 1" $HOME/Library/Preferences/com.apple.digihub.plist

# Disable blank DVD automatic action.
/usr/libexec/PlistBuddy -c "Add :com.apple.digihub.blank.dvd.appeared:action integer" $HOME/Library/Preferences/com.apple.digihub.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Set :com.apple.digihub.blank.dvd.appeared:action 1" $HOME/Library/Preferences/com.apple.digihub.plist

# Ignore = 1                        |  Open iTunes (music only) = 101
# Open iPhoto (picture only) = 107  |  Open DVD Player (video only) = 105

# When you insert a music CD ignore.
/usr/libexec/PlistBuddy -c "Add :com.apple.digihub.cd.music.appeared:action integer" $HOME/Library/Preferences/com.apple.digihub.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Set :com.apple.digihub.cd.music.appeared:action 1" $HOME/Library/Preferences/com.apple.digihub.plist

# When you insert a picture CD ignore.
/usr/libexec/PlistBuddy -c "Add :com.apple.digihub.cd.picture.appeared:action integer" $HOME/Library/Preferences/com.apple.digihub.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Set :com.apple.digihub.cd.picture.appeared:action 1" $HOME/Library/Preferences/com.apple.digihub.plist

# When you insert a video DVD open DVD player.
/usr/libexec/PlistBuddy -c "Add :com.apple.digihub.dvd.video.appeared:action integer" $HOME/Library/Preferences/com.apple.digihub.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Set :com.apple.digihub.dvd.video.appeared:action 106" $HOME/Library/Preferences/com.apple.digihub.plist


# ========================================================================== #
# Displays                                                                   #
# ========================================================================== #

# Display ------------------------------------------------------------------ #

# Do not automatically adjust brightness. (usfull for color calibrated monitors)
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Display Enabled" -bool NO

# Do not automatically show mirroring options in the menu bar when available.
defaults write com.apple.airplay showInMenuBarIfPresent -bool NO


# ========================================================================== #
# Energy Saver                                                               #
# ========================================================================== #

# Becuase preferences vary based on hardware it is recommend to set manually.
# See the pmset manual page for details.

# Slightly dim the display while on battery power.
sudo pmset -b lessbright 0

# Computer sleep on power adapter: (minutes)
sudo pmset -c sleep 60

# Other -------------------------------------------------------------------- #

# Show percentage for battery in menu bar.
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Restart automatically after the system freezes.
sudo systemsetup -setrestartfreeze on

# Automatically restart after a power failure.
sudo systemsetup -setrestartpowerfailure on &>/dev/null


# ========================================================================== #
# Keyboard                                                                   #
# ========================================================================== #

#Turn off backlit keyboard when computer is not used for: (seconds)
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Keyboard Dim Time" -int 300


# ========================================================================== #
# Mouse                                                                      #
# ========================================================================== #

# A what...


# ========================================================================== #
# Trackpad                                                                   #
# ========================================================================== #

# Point & Click ------------------------------------------------------------ #

# Tap to click.
defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool YES
sudo defaults write /Library/Preferences/.GlobalPreferences com.apple.mouse.tapBehavior -int 1

# Secondary click: click or tap with two fingers.
defaults -currentHost write -g com.apple.trackpad.enableSecondaryClick -bool YES
defaults -currentHost write -g com.apple.trackpad.trackpadCornerClickBehavior -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool YES

# Look up.
defaults -currentHost write -g com.apple.trackpad.threeFingerTapGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 2

# Disable three finger drag. (enabling forces Mission Control and App Exposé into four fingers)
defaults -currentHost write -g com.apple.trackpad.threeFingerDragGesture -bool NO
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool NO

# Scroll & Zoom ------------------------------------------------------------ #

# Scroll direction: natural.
defaults write -g com.apple.swipescrolldirection -bool YES

# Zoom in or out.
defaults -currentHost write -g com.apple.trackpad.pinchGesture -bool YES
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadPinch -bool YES

# Smart zoom.
defaults -currentHost write -g com.apple.trackpad.twoFingerDoubleTapGesture -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -int 1

# Rotate.
defaults -currentHost write -g com.apple.trackpad.rotateGesture -bool YES
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -bool YES

# More Gestures ------------------------------------------------------------ #

# Swipe between pages: scroll left or right with two fingers. ??
defaults -currentHost write -g com.apple.trackpad.threeFingerHorizSwipeGesture -int 2
defaults -currentHost write -g com.apple.trackpad.fourFingerHorizSwipeGesture -int 2

# Swipe between full-screen apps: swipe left or right with three fingers. ??
defaults -currentHost write -g com.apple.trackpad.threeFingerHorizSwipeGesture -int 2
defaults -currentHost write -g com.apple.trackpad.fourFingerHorizSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 2

# Notifications Center.
defaults -currentHost write -g com.apple.trackpad.twoFingerFromRightEdgeSwipeGesture -int 3
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3

# Mission Control: swipe up with three fingers.
defaults write com.apple.dock showMissionControlGestureEnabled -bool YES
defaults -currentHost write -g com.apple.trackpad.threeFingerVertSwipeGesture -int 2
defaults -currentHost write -g com.apple.trackpad.fourFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 2

# App Exposé: swipe down with three fingers.
defaults write com.apple.dock showAppExposeGestureEnabled -bool YES
defaults -currentHost write -g com.apple.trackpad.threeFingerVertSwipeGesture -int 2
defaults -currentHost write -g com.apple.trackpad.fourFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 2

# Launchpad.
defaults write com.apple.dock showLaunchpadGestureEnabled -bool YES
defaults -currentHost write -g com.apple.trackpad.fourFingerPinchSwipeGesture -int 2
defaults -currentHost write -g com.apple.trackpad.fiveFingerPinchSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerPinchGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFiveFingerPinchGesture -int 2

# Show Desktop.
defaults write com.apple.dock showDesktopGestureEnabled -bool YES
defaults -currentHost write -g com.apple.trackpad.fourFingerPinchSwipeGesture -int 2
defaults -currentHost write -g com.apple.trackpad.fiveFingerPinchSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerPinchGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFiveFingerPinchGesture -int 2

# Other -------------------------------------------------------------------- #

# Enable Application Windows swipe up with two fingers on application icon.
defaults write com.apple.dock scroll-to-open -bool YES


# ========================================================================== #
# Print & Scan                                                               #
# ========================================================================== #

# Other -------------------------------------------------------------------- #

# Show Details in Print… panel
defaults write -g PMPrintingExpandedStateForPrint2 -bool YES


# ========================================================================== #
# Sound                                                                      #
# ========================================================================== #

# Do not show volume in menu bar.
defaults -currentHost write com.apple.systemuiserver dontAutoLoad -array-add '/System/Library/CoreServices/Menu Extras/Volume.menu'

# ========================================================================== #
# iCloud                                                                     #
# ========================================================================== #

# Other -------------------------------------------------------------------- #

# Set default save location to Mac.
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool NO


# ========================================================================== #
# Network                                                                    #
# ========================================================================== #

# Create a link to airport
sudo ln -fs "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport" "/usr/sbin/airport"

# Other -------------------------------------------------------------------- #

# Disconnect Wi-Fi on logout
# sudo airport prefs DisconnectOnLogout=YES

# Join Preferred Wi-Fi networks
# Automatic | Preferred | Ranked | Recent | Strongest
sudo airport prefs JoinMode=Preferred

# Do not ask to join new networks
# Prompt | JoinOpen | KeepLooking | DoNothing
sudo airport prefs JoinModeFallback=DoNothing

# Do not remember networks this computer has joined.
sudo airport prefs RememberRecentNetworks=NO

# Require administrator authorization to create computer-to-computer networks.
sudo airport prefs RequireAdminIBSS=YES

# Require administrator authorization to change networks.
sudo airport prefs RequireAdminNetworkChange=YES

# Require administrator authorization to turn Wi-Fi on or off.
sudo airport prefs RequireAdminPowerToggle=NO

# Disable wake for Wi-Fi network access.
# sudo airport prefs WoWEnabled=NO


# ========================================================================== #
# Bluetooth                                                                  #
# ========================================================================== #

# Do not show Bluetooth in menu bar.
defaults -currentHost write com.apple.systemuiserver dontAutoLoad -array-add '/System/Library/CoreServices/Menu Extras/Bluetooth.menu'

# See Desktop above above...

# Advanced ----------------------------------------------------------------- #

# Reject incoming auto requests.
defaults -currentHost write com.apple.Bluetooth IsPromptingForIncomingAudioDevices -bool NO

# Turn off Bluetooth-PDA-Sync.
sudo /usr/libexec/PlistBuddy -c "Set ':PersistentPorts:incoming port - Bluetooth-PDA-Sync:BTEanbledState' -bool NO:" /Library/Preferences/com.apple.Bluetooth.plist

# ========================================================================== #
# Sharing                                                                    #
# ========================================================================== #

# Set the user-friendly name for the computer.
sudo scutil --set ComputerName "$COMPUTER_NAME"

# Set the local (Bonjour) host name. (.local)
sudo scutil --set LocalHostName "$HOST_NAME"

# Set the name associated with hostname and gethostname.
sudo scutil --set HostName "$HOST_NAME"

# Set the Windows host name.
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$HOST_NAME"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server ServerDecription -string "$COMPUTER_NAME"

# Set the local subnet name.
sudo systemsetup -setlocalsubnetname "$HOST_NAME" &>/dev/null

# Turn on remote login (SSH)
sudo systemsetup -setremotelogin on &>/dev/null

# ========================================================================== #
# Users & Groups                                                             #
# ========================================================================== #

# Do not allow guest to connect to shared folders
sudo defaults write /Library/Preferences/com.apple.AppleFileServer guestAccess -bool NO
sudo defaults write /Library/Preferences/com.apple.smb.server AllowGuestAccess -bool NO

# Display login window as name and password.
sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWFULLNAME -bool YES

# Do not show the Sleep, Restart, and Shut Down buttons.
sudo defaults write /Library/Preferences/com.apple.loginwindow PowerOffDisabled -bool NO

# Do not show password hints.
sudo defaults write /Library/Preferences/com.apple.loginwindow RetriesUntilHint -int 0

# Disable fast user switching.
sudo defaults write /Library/Preferences/.GlobalPreferences MultipleSessionEnabled -bool NO
defaults -currentHost write com.apple.systemuiserver dontAutoLoad -array-add '/System/Library/CoreServices/Menu Extras/User.menu'
sudo killall SystemUIServer

# show groups
defaults write com.apple.systempreference com.apple.preferences.accounts._showallgroups -bool YES
# TODO defaults write com.apple.systempreference.com com.apple.preferences.accounts.outline.usersparent -bool YES


# ========================================================================== #
# Date & Time                                                                #
# ========================================================================== #

# Date & Time -------------------------------------------------------------- #

# Set data and time automatically.
systemsetup -setusingnetworktime on &>/dev/null

# Network time server. (IP address or DNS name)
systemsetup -setnetworktimeserver us.pool.ntp.org &>/dev/null

# Time Zone ---------------------------------------------------------------- #

# Set the local time zone. Set city in System Prefereces...
systemsetup -settimezone "America/Los_Angeles" &>/dev/null

# Clock -------------------------------------------------------------------- #

# Do not show date and time in menu bar.
defaults -currentHost write com.apple.systemuiserver dontAutoLoad -array-add '/System/Library/CoreServices/Menu Extras/Clock.menu'


# ========================================================================== #
# Software Update                                                            #
# ========================================================================== #

# Automatically check for updates every [] days.
# TODO sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Do not download newly available updates in the background
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool NO

# Hide from Apple and don't use a local CDN
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate SkipLocalCDN -bool YES


# ========================================================================== #
# Diction & Speech                                                           #
# ========================================================================== #

# Text to Speech ----------------------------------------------------------- #

# Announce when an application requires your attention.
defaults write com.apple.speech.synthesis.general.prefs SpokenNotificationAppActivationFlag -bool YES

# ========================================================================== #
# Time Machine (tmutil)                                                      #
# ========================================================================== #

# Limit size of Time Machine Backup Disk (512GB x 1024 = 524288)
sudo defaults write /Library/Preferences/com.apple.TimeMachine MaxSize $MAX_BACKUP_SIZE

# exclude all system files (System Files and Applications)
sudo defaults write /Library/Preferences/com.apple.TimeMachine SkipSystemFiles -bool YES
sudo defaults write /Library/Preferences/com.apple.TimeMachine SkipPaths -array "/System"

# TODO exclude other files
# defaults write /Library/Preferences/com.apple.TimeMachine ExcludeByPath "( /Applications, /Developer )"

# Disable backup to new disks
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES

# Other -------------------------------------------------------------------- #

# Turn off local Time Machine snapshots.
sudo tmutil disablelocal

# ========================================================================== #
# Other                                                                      #
# ========================================================================== #

# Archives ----------------------------------------------------------------- #

# Add archives to System Preferences.
sudo ln -fs "/System/Library/CoreServices/Archive Utility.app/Contents/Resources/Archives.prefPane" "/Library/PreferencePanes/Archives.prefPane"

# Clean Up ----------------------------------------------------------------- #

# Restart menu bar extras.
sudo killall SystemUIServer

# Flush DNS cache.
dscacheutil -flushcache
sudo killall -HUP mDNSResponder

# Rename startup disk to match computer name.
diskutil renameVolume /Volumes/Macintosh\ HD "$COMPUTER_NAME HD" &>/dev/null

# Give the system time to commit changes from cache.
for (( i = 0; i < 20; i++ )); do
    echo -n "##" ; sleep 1
    echo -n "##" ; sleep 2
done
echo ""

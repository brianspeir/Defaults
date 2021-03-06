#!/bin/bash
#

# Safari.defaults v1.0.0
# This script sets defaults for Safari.
# www.brianspeir.com
#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License. You may not use this file except
# in compliance with the License. You may obtain a copy of the License at
# http://opensource.org/licenses/BSD-3-Clause


# General ------------------------------------------------------------------ #

# Default search engine systempreferences.
defaults write com.apple.Safari HasPendingDefaultSearchProvider -bool NO
/usr/libexec/PlistBuddy -c "Add :NSPreferredWebServices:NSWebServicesProviderWebSearch dictionary" $HOME/Library/Preferences/.GlobalPreferences.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :NSPreferredWebServices:NSWebServicesProviderWebSearch:NSDefaultDisplayName string" $HOME/Library/Preferences/.GlobalPreferences.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Set :NSPreferredWebServices:NSWebServicesProviderWebSearch:NSDefaultDisplayName Google" $HOME/Library/Preferences/.GlobalPreferences.plist
/usr/libexec/PlistBuddy -c "Add :NSPreferredWebServices:NSWebServicesProviderWebSearch:NSProviderIdentifier string" $HOME/Library/Preferences/.GlobalPreferences.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Set :NSPreferredWebServices:NSWebServicesProviderWebSearch:NSProviderIdentifier com.google.www" $HOME/Library/Preferences/.GlobalPreferences.plist

# Safari opens with a new window. (not all windows from last session)
defaults write com.apple.Safari AlwaysRestoreSessionAtLaunch -bool NO

# New windows open with:
# Empty Page = 1 | Top Sites = 4 | Homepage = 0
# Same Page = 3  | Bookmarks = 2
defaults write com.apple.Safari NewWindowBehavior -int 1

# New tabs open with:
# Empty Page = 1 | Top Sites = 4 | Homepage = 0
# Same Page = 3  | Bookmarks = 2
defaults write com.apple.Safari NewTabBehavior -int 1

# Set blank homepage.
defaults write com.apple.Safari HomePage -string ""
defaults write com.apple.internetconfigpriv WWWHomePage -string ""

# Remove history items:
# After one day = 1    | After one week = 7   | After two weeks = 14
# After one month = 31 | After one year = 365 | Manually = 365000
defaults write com.apple.Safari HistoryAgeInDaysLimit -int 365

# Limit history item count.
# defaults write com.apple.Safari WebKitHistoryItemLimit -int
# defaults write com.apple.Safari RecentHistoryMenuItemsLimit -int

# Save downloaded files to Downloads folder.
defaults write com.apple.Safari DownloadsPath -string "$HOME/Downloads"
defaults write com.apple.Safari DownloadsPathWasConverted -bool YES

# Remove download list items upon successful download.
defaults write com.apple.Safari DownloadsClearingPolicy -int 2

# Do not open "safe" files after downloading.
defaults write com.apple.Safari AutoOpenSafeDownloads -bool NO

# Bookmarks ---------------------------------------------------------------- #

# Remove Top Sites from bookmarks bar.
defaults write com.apple.Safari ProxiesInBookmarksBar -array "Reading List"
defaults write com.apple.Safari DidAddReadingListToBookmarksBar -bool YES
defaults write com.apple.Safari DidMigrateNewBookmarkSheetToReadingListDefault -bool YES
defaults write com.apple.Safari DidMigrateTabsToLinksForReaderKey -bool YES
defaults write com.apple.Safari ConvertedNewWindowBehaviorForTopSites -bool YES
defaults write com.apple.Safari BookmarksToolbarProxiesWereConvertedForSafari4 -bool YES

# Remove Reading List from bookmarks bar.
defaults write com.apple.Safari DidAddReadingListToBookmarksBar -bool YES

# AutoFill ----------------------------------------------------------------- #

# Do not AutoFill web forms using info from my Contacts card.
defaults write com.apple.Safari AutoFillFromAddressBook -bool NO

# AutoFill web forms user names and passwords.
defaults write com.apple.Safari AutoFillPasswords -bool YES

# Do not AutoFill other web forms.
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool NO

# Security ----------------------------------------------------------------- #

# Do not warn when visiting a fraudulent website. Because it causes Safari to fuck up.
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool NO

# Enable plug-ins.
defaults write com.apple.Safari WebKitPluginsEnabled -bool YES

# Disable Java.
defaults write com.apple.Safari WebKitJavaEnabled -bool NO
sudo mkdir -p "/Library/Internet Plug-Ins/disabled" &>/dev/null
sudo mv "/Library/Internet Plug-Ins/JavaAppletPlugin.plugin" "/Library/Internet Plug-Ins/disabled" &>/dev/null

# Enable JavaScript
defaults write com.apple.Safari WebKitJavaScriptEnabled -bool YES

# Block pop-up windows.
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool NO

# Privacy ------------------------------------------------------------------ #

# Block cookies from third parties and advertisers.


# Limit website access to location services.
defaults write com.apple.Safari SafariGeolocationPermissionPolicy -int 1

# Ask websites no to track me.
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool YES

# Prevent search engine from providing suggestions.
defaults write com.apple.Safari SuppressSearchSuggestions -bool YES

# Extensions --------------------------------------------------------------- #

# Disable extensions.
defaults write com.apple.Safari ExtensionsEnabled -bool NO

# Advanced ----------------------------------------------------------------- #

# Show Develop menu in menu bar.
defaults write com.apple.Safari IncludeDevelopMenu -bool YES

# Other -------------------------------------------------------------------- #

# Resume Safari on relaunch.
# defaults write com.apple.Safari NSQuitAlwaysKeepsWindows

# Show Debug menu in menu bar.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool YES
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool YES
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool YES

# Show Status Bar.
defaults write com.apple.Safari ShowStatusBar -bool YES

# Hide bookmarks bar.
defaults write com.apple.Safari ShowFavoritesBar -bool NO

# Disable "Would you like to allow other OS X applications to use this ... account?"
defaults write com.apple.Safari DomainsToNeverSetUp -array "icloud.com" "outlook.com" "hotmail.com" "google.com" "twitter.com" "facebook.com" "yahoo.com" "aol.com" "vimeo.com" "flicker.com"

# Disable Safari thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enable Inspect Element in the App Store
defaults write com.apple.appstore WebKitDeveloperExtras -bool YES

# Limit object (images, movies, sounds, etc.) cache size in RAM:
# Caution! Recommended for debugging only. Use at your own risk.
defaults write com.apple.Safari WebKitObjectCacheSizePreferenceKey -int 2048

# Limit page cache size in RAM:
# Caution! Recommended for debugging only. Use at your own risk.
defaults write com.apple.Safari WebKitPageCacheSizePreferenceKey -int 2048

# Set back and forward RAM cache expiration (sconds):
defaults write com.apple.Safari WebKitBackForwardCacheExpirationIntervalKey -int 512

# Disable DNS prefetching.
defaults write com.apple.Safari WebKitDNSPrefetchingEnabled -bool NO

# Show Details in Print… panel.
defaults write com.apple.Safari PMPrintingExpandedStateForPrint -bool YES

#!/bin/bash
#

# Chrome.defaults v1.0.0
# This script sets defaults for Google Chrome.
# www.brianspeir.com
#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License. You may not use this file except
# in compliance with the License. You may obtain a copy of the License at
# http://opensource.org/licenses/BSD-3-Clause


# Settings ----------------------------------------------------------------- #

# On startup continue where I left off.
defaults write com.google.Chrome RestoreOnStartup -int 1

# Do not make Google Chrome the default browser.
defaults write com.google.Chrome DefaultBrowserSettingEnabled -bool NO

# Block sites from setting any data.
# defaults write com.google.Chrome DefaultCookiesSetting -int 2

# Block third-party cookies and site data.
# defaults write com.google.Chrome BlockThirdPartyCookies -bool YES

# Do not allow any site to handle protocols.

# Click to play plug-ins.
# defaults write com.google.Chrome DefaultPluginsSetting -int 3

# Do not allow any site to show pop-ups.
# defaults write com.google.Chrome DefaultPopupsSetting -int 2

# Do not allow any site to track my physical location.
defaults write com.google.Chrome DefaultGeolocationSetting -int 2

# Do not allow any site to show desktop notifications.
defaults write com.google.Chrome DefaultNotificationsSetting -int 2

# Do not allow any site to disable the mouse cursor.

# Do not allow sites to access my camera and microphone.
defaults write com.google.Chrome VideoCaptureAllowed -bool NO
defaults write com.google.Chrome AudioCaptureAllowed -bool NO

# Do not allow any site to use a plug-in to access my computer.
# defaults write com.google.Chrome AllowFileSelectionDialogs -bool NO

# Do not use a web service to help resolve navigation errors.

# Do not use a prediction service to help complete searches and URLs typed in the address bar.
defaults write com.google.Chrome SearchSuggestEnabled -bool NO

# Do not predict network actions to improve page load performance.
defaults write com.google.Chrome DnsPrefetchingEnabled -bool NO

# Send a 'Do Not Track' request with browsing traffic.

# Do not enable Autofill to fill out web forms in a single click.
defaults write com.google.Chrome AutoFillEnabled -bool NO

# Disable Google Cloud Print proxy.
defaults write com.google.Chrome CloudPrintProxyEnabled -bool NO

# Disable submission of documents to Google Cloud Print.
defaults write com.google.Chrome CloudPrintSubmitEnabled -bool NO

# Other -------------------------------------------------------------------- #

# Disable automatic updates
defaults write com.google.Keystone.Agent checkInterval -int 0

# Set blank home page.
defaults write com.google.Chrome HomepageLocation -string "1"

# Do not allow outdated plugins.
defaults write com.google.Chrome AllowOutdatedPlugins -bool NO

# Do not continue running background apps when Chromium is closed
defaults write com.google.Chrome BackgroundModeEnabled -bool NO

# Do not use built-in DNS client.
defaults write com.google.Chrome BuiltInDnsClientEnabled -bool NO

# Disable the automatic search and installation of missing plugins.
defaults write com.google.Chrome DisablePluginFinder -bool YES

# Hide the web store from the new tab page and app launcher.
defaults write com.google.Chrome HideWebStoreIcon -bool YES

# Do not allow browser sign in.
defaults write com.google.Chrome SigninAllowed -bool NO

# List of pinned apps to show in the launcher.
defaults write com.google.Chrome PinnedLauncherApps -array

# Do not import bookmarks from default browser on first run.
defaults write com.google.Chrome ImportBookmarks -bool NO

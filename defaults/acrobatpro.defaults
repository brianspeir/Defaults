#!/bin/bash
#

# AcrobatPro.defaults v1.0.0
# This script creates notes for manual defaults for Adobe Acrobat Pro X.
# www.brianspeir.com
#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License. You may not use this file except
# in compliance with the License. You may obtain a copy of the License at
# http://opensource.org/licenses/BSD-3-Clause


# Extend the password time stamp.
sudo -v

# Documents ---------------------------------------------------------------- #

# Remove hidden information when closing document.
/usr/libexec/PlistBuddy -c "Add :10:Security:AutoLaunchAtDocClose array" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:Security:AutoLaunchAtDocClose:0 integer 0" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:Security:AutoLaunchAtDocClose:1 bool YES" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null

# Remove hidden information when sending document by email.
/usr/libexec/PlistBuddy -c "Add :10:Security:AutoLaunchAtSendMail array" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:Security:AutoLaunchAtSendMail:0 integer 0" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:Security:AutoLaunchAtSendMail:1 bool YES" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null

# General ------------------------------------------------------------------ #

# Do not show messages from Adobe when I launch Acrobat.
/usr/libexec/PlistBuddy -c "Add :10:IPM:ShowMsgAtLaunch array" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:IPM:ShowMsgAtLaunch:0 integer 0" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:IPM:ShowMsgAtLaunch:1 bool NO" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
# Do not show splash screen.
/usr/libexec/PlistBuddy -c "Add :10:ShowSplashScreen bool NO" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null

# Do not show welcome screen.
/usr/libexec/PlistBuddy -c "Add :10:AVGeneral:ShowWelcomeScreen array" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:AVGeneral:ShowWelcomeScreen:0 integer 0" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:AVGeneral:ShowWelcomeScreen:1 bool NO" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null

# Page Display ------------------------------------------------------------- #

# Use custom resolution of 110 pixels/inch for 15-inch MacBook Pro with Retina.
/usr/libexec/PlistBuddy -c "Add :10:Originals:PixelsPerInch array" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:Originals:PixelsPerInch:0 integer 1" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:Originals:PixelsPerInch:1 integer 110" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null

# Internet ----------------------------------------------------------------- #

# Disable Internet Plug-Ins
sudo mkdir -p "/Library/Internet Plug-Ins/disabled" &>/dev/null
sudo mv "/Library/Internet Plug-Ins/AdobeAAMDetect.plugin" "/Library/Internet Plug-Ins/disabled" &>/dev/null
sudo mv "/Library/Internet Plug-Ins/AdobeExManDetect.plugin" "/Library/Internet Plug-Ins/disabled" &>/dev/null
sudo mv "/Library/Internet Plug-Ins/AdobePDFViewer.plugin" "/Library/Internet Plug-Ins/disabled" &>/dev/null
sudo mv "/Library/Internet Plug-Ins/AdobePDFViewerNPAPI.plugin" "/Library/Internet Plug-Ins/disabled" &>/dev/null

# JavaScript --------------------------------------------------------------- #

# Disable Acrobat JavaScript.
/usr/libexec/PlistBuddy -c "Add :10:JSPrefs:EnableJS array" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:JSPrefs:EnableJS:0 integer 0" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:JSPrefs:EnableJS:1 bool NO" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null

# Trust Manager ------------------------------------------------------------ #

# Block PDF files' access to all web sites.
/usr/libexec/PlistBuddy -c "Add :10:TrustManager:DefaultLaunchURLPerms array" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:TrustManager:DefaultLaunchURLPerms:0 integer 8" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:TrustManager:DefaultLaunchURLPerms:1 dict" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:TrustManager:DefaultLaunchURLPerms:1:URLPerms array" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:TrustManager:DefaultLaunchURLPerms:1:URLPerms:0 integer 1" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:TrustManager:DefaultLaunchURLPerms:1:URLPerms:1 integer 1" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null

# Ask before updating trusted root certificates from an Adobe server.
/usr/libexec/PlistBuddy -c "Add :10:Security:DigSig array" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:Security:DigSig:0 integer 8" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:Security:DigSig:1 dict" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:Security:DigSig:1:AdobeDownload array" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:Security:DigSig:1:AdobeDownload:0 integer 8" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:Security:DigSig:1:AdobeDownload:1 dict" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:Security:DigSig:1:AdobeDownload:1:AskBeforeInstalling array" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:Security:DigSig:1:AdobeDownload:1:AskBeforeInstalling:0 integer 0" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:Security:DigSig:1:AdobeDownload:1:AskBeforeInstalling:1 bool YES" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:Security:DigSig:1:AdobeDownload:1:LoadSettingsFromURL array" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:Security:DigSig:1:AdobeDownload:1:LoadSettingsFromURL:0 integer 0" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:Security:DigSig:1:AdobeDownload:1:LoadSettingsFromURL:1 bool YES" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null

# Updater ------------------------------------------------------------------ #

# Do not download or install updates automatically.
/usr/libexec/PlistBuddy -c "Add :10:Updater:FirstTimeAppHasRun array" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:Updater:FirstTimeAppHasRun:0 integer 0" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:Updater:FirstTimeAppHasRun:1 bool NO" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:AVGeneral:CheckForUpdatesAtStartup array" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:AVGeneral:CheckForUpdatesAtStartup:0 integer 0" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:AVGeneral:CheckForUpdatesAtStartup:1 bool NO" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null

# Other -------------------------------------------------------------------- #

# Do not show this message again: Would you like to make PDF files open iwth Adobe Acrobat Pro intead of Preview?
/usr/libexec/PlistBuddy -c "Add :10:AVAlert:Checkbox array" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:AVAlert:Checkbox:0 integer 8" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:AVAlert:Checkbox:1 dict" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:AVAlert:Checkbox:1:OptionToOwn array" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:AVAlert:Checkbox:1:OptionToOwn:0 integer 1" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Add :10:AVAlert:Checkbox:1:OptionToOwn:1 integer 1" $HOME/Library/Preferences/com.adobe.Acrobat.Pro.plist &>/dev/null

defaults write com.adobe.CSXSPreferences UpdatesAllowed -string 0
sudo rm /Library/Preferences/com.adobe.CSXSPreferences.plist &>/dev/null

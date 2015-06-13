#!/bin/bash
#

# Calendar.defaults v1.0.0
# This script sets defaults for Mac OS X Calendar (Mountain Lion).
# www.brianspeir.com
#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License. You may not use this file except
# in compliance with the License. You may obtain a copy of the License at
# http://opensource.org/licenses/BSD-3-Clause


# General ------------------------------------------------------------------ #

# Days per week:
defaults write com.apple.iCal "n days of week" -int 7

# Start week on...
# 0 = "Sunday | 1 = "Monday"
defaults write com.apple.iCal "first day of week" -int 0

# Day starts at: (minutes)
defaults write com.apple.iCal "first minute of work hours" -int 540

# Day ends at: (minutes)
defaults write com.apple.iCal "last minute of work hours" -int 1020

# Show 16 hours at a time.
defaults write com.apple.iCal "number of hours displayed" -int 12

# Show event times in week and month view.
defaults write com.apple.iCal "Show time in Month View" -bool YES

# Show Birthdays calendar.
defaults write com.apple.iCal "display birthdays calendar" -bool YES

# Advanced ----------------------------------------------------------------- #

# Turn on time zone support
defaults write com.apple.iCal "TimeZone support enabled" -bool YES

# Show events in year view. (heat map)
defaults write com.apple.iCal "Show heat map in Year View" -bool YES

# Do not ask before sending changes to events.
defaults write com.apple.iCal WarnBeforeSendingInvitations -bool NO

# Automatically retrieve CalDAV invitations from Mail.
defaults write com.apple.mail AddInvitationsToICalAutomatically -bool YES


# Alerts ------------------------------------------------------------------- #

# Events, all day events and birthdays cannot be set through defaults.

# Turn on shared calendar messages in Notification Center.
defaults write com.apple.iCal "Disable shared calendar alerts" -bool YES

# Turn on invitation messages in Notification Center.
defaults write com.apple.iCal "Disable invitation alerts" -bool YES

# Other -------------------------------------------------------------------- #

# Show declined events.
defaults write com.apple.iCal showDeclinedEvents -int 1

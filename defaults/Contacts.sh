#!/bin/bash
#

# Contacts.defaults v1.0.0
# This script sets defaults for Mac OS X Contacts (Mountain Lion).
# www.brianspeir.com
#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License. You may not use this file except
# in compliance with the License. You may obtain a copy of the License at
# http://opensource.org/licenses/BSD-3-Clause


# General ------------------------------------------------------------------ #

# Set by first name.
defaults write com.apple.AddressBook ABNameSortingFormat -string "sortingFirstName sortingLastName"

# Template ----------------------------------------------------------------- #

# Add birthday field to template.
defaults write com.apple.AddressBook ABBirthDayVisible -int 1

# vCard -------------------------------------------------------------------- #

# Enable private me card.
defaults write com.apple.AddressBook ABPrivateVCardFieldsEnabled -bool YES

# Disable export notes in vCard.
defaults write com.apple.AddressBook ABIncludeNotesInVCard -bool NO

# Disable export photos in vCard.
defaults write com.apple.AddressBook ABIncludePhotosInVCard -bool NO

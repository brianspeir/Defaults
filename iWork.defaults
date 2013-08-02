#!/bin/bash
#

# iWork.defaults v1.0.0
# This script sets defaults for iWork '09.
# www.brianspeir.com
#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License. You may not use this file except
# in compliance with the License. You may obtain a copy of the License at
# http://opensource.org/licenses/BSD-3-Clause


# Disable welcome screen.
defaults write com.apple.iWork09 ShouldNotSendRegistration -bool YES

# -------------------------------------------------------------------------- #
# Pages                                                                      #
# -------------------------------------------------------------------------- #

# General ------------------------------------------------------------------ #

# Set change tracking author to blank.
defaults write com.apple.iWork.Pages SLDefaultsChangeTrackingAuthor -string ""

# Underline inserted text for changes.
defaults write com.apple.iWork.Pages SLDefaultsChangeTrackingInsertedTextStyleIndex -int 0
defaults write com.apple.iWork.Pages SLDefaultsChangeTrackingInsertedTextStyleProperties -dict underline -int 1

# Rulers ------------------------------------------------------------------- #

# Ruler units in points.
defaults write com.apple.iWork.Pages RulerUnits -int 2

# Show alignment guides at object center
defaults write com.apple.iWork.Pages SFDefaultsShowAlignmentGuidesAtCenter -bool YES

# Show alignment guides at object edge
defaults write com.apple.iWork.Pages SFDefaultsShowAlignmentGuidesAtEdges -bool YES

# Enable verticle ruler in word processing documents.
defaults write com.apple.iWork.Pages SLDefaultsShowVerticalRulerInWP -bool YES

# Auto-Correction ---------------------------------------------------------- #

# Disable automatically detect email and web addresses.
defaults write com.apple.iWork.Pages SFWPAutoHyperlinkCreation -bool NO

# Enable symbol and text substitution.
defaults write com.apple.iWork.Pages kSFWPAutoSubstitutionProperty -bool YES

# Other ------------------------------------------------------------------- #

# Disable welcome screen.
defaults write com.apple.iWork.Pages dontShowWhatsNew -bool YES
defaults -currentHost write com.apple.iWork.Pages FirstRunFlag -bool YES

# -------------------------------------------------------------------------- #
# Numbers                                                                    #
# -------------------------------------------------------------------------- #

# General ------------------------------------------------------------------ #

# Show font preview in Format Bar font menu.
defaults write com.apple.iWork.Numbers SFIFontMenuPreview -bool YES

# Rulers ------------------------------------------------------------------- #

# Show alignment guides at object center
defaults write com.apple.iWork.Numbers SFDefaultsShowAlignmentGuidesAtCenter -bool YES

# Show alignment guides at object edge
defaults write com.apple.iWork.Numbers SFDefaultsShowAlignmentGuidesAtEdges -bool YES

# Auto-Correction ---------------------------------------------------------- #

# Disable automatically detect email and web addresses.
defaults write com.apple.iWork.Numbers SFWPAutoHyperlinkCreation -bool NO

# Enable symbol and text substitution.
defaults write com.apple.iWork.Numbers kSFWPAutoSubstitutionProperty -bool YES

# Other ------------------------------------------------------------------- #

# Disable welcome screen.
defaults write com.apple.iWork.Numbers dontShowWhatsNew -bool YES
defaults -currentHost write com.apple.iWork.Numbers FirstRunFlag -bool YES


# -------------------------------------------------------------------------- #
# Keynote                                                                    #
# -------------------------------------------------------------------------- #

# Rulers ------------------------------------------------------------------- #

# Show alignment guides at object center
defaults write com.apple.iWork.Keynote PopUpGuidesAlignCenters -bool YES

# Show alignment guides at object edge
defaults write com.apple.iWork.Keynote PopUpGuidesAlignEdges -bool YES

# Remote ------------------------------------------------------------------- #

# Enable iPhone and iPod touch remotes.
defaults write com.apple.iWork.Keynote BGEnabledRemote -bool YES

# Auto-Correction ---------------------------------------------------------- #

# Disable automatically detect email and web addresses.
defaults write com.apple.iWork.Keynote SFWPAutoHyperlinkCreation -bool NO

# Disable underline text hyperlinks on creation.
defaults write com.apple.iWork.Keynote UnderlineTextHyperlinks -bool NO

# Enable symbol and text substitution.
defaults write com.apple.iWork.Keynote kSFWPAutoSubstitutionProperty -bool YES

# Other ------------------------------------------------------------------- #

# Disable welcome screen.
defaults write com.apple.iWork.Keynote dontShowWhatsNew -bool YES
defaults write com.apple.iWork.Keynote BGApplicationShowKeynote509Welcome -bool NO
defaults -currentHost write com.apple.iWork.Keynote FirstRunFlag -bool YES

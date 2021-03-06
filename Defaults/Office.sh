#!/bin/bash
#

# Office.defaults v1.0.0
# This script sets defaults for Microsoft Office.
# www.brianspeir.com
#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License. You may not use this file except
# in compliance with the License. You may obtain a copy of the License at
# http://opensource.org/licenses/BSD-3-Clause


# Other -------------------------------------------------------------------- #

# Because Microsoft can't figure it out. Move Microsoft User Data into the Library.
mkdir -p "$HOME/Library/Microsoft/Office/Microsoft User Data"

if [[ -f "$HOME/Documents/Microsoft User Data" ]]; then
    # Move existing files.
    mv "$HOME/Documents/Microsoft User Data" "$HOME/Library/Microsoft/Office"
fi

# Create a link so Microsoft doesn't get lost.
ln -fs "$HOME/Library/Microsoft/Office/Microsoft User Data" "$HOME/Documents/Microsoft User Data"
chflags -h hidden "$HOME/Documents/Microsoft User Data"

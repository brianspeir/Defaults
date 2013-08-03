#!/bin/bash
#

# Vagrant.defaults v1.0.0
# This script sets defaults for Vagrant and VirtualBox.
# www.brianspeir.com
#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License. You may not use this file except
# in compliance with the License. You may obtain a copy of the License at
# http://opensource.org/licenses/BSD-3-Clause


# VirtualBox --------------------------------------------------------------- #

# Default machine folder.
VBoxManage setproperty machinefolder $HOME/Library/VirtualBox/Machines

# Vagrant ------------------------------------------------------------------ #

# Modify default_home_path to better suite Mac OS.
export VAGRANT_HOME="$HOME/Library/Application Support/Vagrant"
mkdir -p "$HOME/Library/Preferences/Vagrant" &>/dev/null
chmod 700 "$HOME/Library/Preferences/Vagrant"
cat > "$HOME/Library/Preferences/Vagrant/profile" <<'EOF'
# Modify default_home_path to better suite Mac OS.
export VAGRANT_HOME="$HOME/Library/Application Support/Vagrant"
export GEM_PATH="$HOME/Library/Application Support/Vagrant/gems"
EOF

# Export the profile to sources.
if [ -r "$HOME/Library/Preferences/Shell/sources" ]; then
    echo '. "$HOME/Library/Preferences/Vagrant/profile"' >> "$HOME/Library/Preferences/Shell/sources"
    sort -uo "$HOME/Library/Preferences/Shell/sources" "$HOME/Library/Preferences/Shell/sources"
fi

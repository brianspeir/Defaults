#!/bin/bash
#

# MacPorts.defaults v1.0.0
# This script sets defaults for MacPorts.
# www.brianspeir.com
#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License. You may not use this file except
# in compliance with the License. You may obtain a copy of the License at
# http://opensource.org/licenses/BSD-3-Clause


# Extend the password time stamp.
sudo -v

# Export MacPorts location to paths.
if [ -r "$HOME/Library/Preferences/Shell/paths" ]; then
    echo 'export PATH=/opt/local/bin:/opt/local/sbin:$PATH' >> "$HOME/Library/Preferences/Shell/paths"
    sort -uo "$HOME/Library/Preferences/Shell/paths" "$HOME/Library/Preferences/Shell/paths"
fi

# Create location.
mkdir -p "$HOME/Library/Preferences/MacPorts" &>/dev/null
chmod 700 "$HOME/Library/Preferences/MacPorts"

# Link sources.conf to Preferences.
cat > "$HOME/Library/Preferences/MacPorts/sources.conf" <<'EOF'
# MacPorts system-wide configuration file for ports tree sources.
file:///opt/local/var/shared/sources/ports
rsync://rsync.macports.org/release/tarballs/ports.tar [default]
EOF
sudo ln -fs "$HOME/Library/Preferences/MacPorts/sources.conf" "/opt/local/etc/macports/sources.conf"
sudo chmod -h 444 "/opt/local/etc/macports/sources.conf"

# Setup local MacPorts portfile repository.
sudo mkdir -p /opt/local/var/shared/sources
cd /opt/local/var/shared/sources && \
sudo git clone https://github.com/brianspeir/Ports.git
cd /opt/local/var/shared/sources/Ports && sudo /opt/local/bin/portindex


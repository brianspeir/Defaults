#!/bin/bash
#

# EC2.defaults v1.0.0
# This script sets defaults for Amazon EC2 API Tools for Mac.
# www.brianspeir.com
#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License. You may not use this file except
# in compliance with the License. You may obtain a copy of the License at
# http://opensource.org/licenses/BSD-3-Clause


# Setup for the Amazon EC2 API Tools.
mkdir -p "$HOME/Library/Preferences/AWS" &>/dev/null
chmod 700 "$HOME/Library/Preferences/AWS"
cat > "$HOME/Library/Preferences/AWS/profile" <<'EOF'
# Setup for the Amazon EC2 Command-Line Tools.
# docs.aws.amazon.com/AWSEC2/latest/UserGuide/SettingUp_CommandLine.html

# Tell the tools where Java lives.
export JAVA_HOME=$(/usr/libexec/java_home)

# Tell the tools where they live.
export EC2_HOME=/Library/Bundles/EC2.bundle/Contents/MacOS

# Tell the tools who you are. You can use AWS_CREDENTIALS to hide the location
# of your credentials. Or fill them in below.
if [ "$AWS_CREDENTIALS" ]; then
    . "$AWS_CREDENTIALS"
else
    echo "You have not set your AWS credentials."
fi

# Set the region.
# http://docs.aws.amazon.com/general/latest/gr/rande.html#ec2_region
# export EC2_URL=https://<service_endpoint>
EOF

# Export the profile to sources.
if [ -r "$HOME/Library/Preferences/Shell/sources" ]; then
    echo '. "$HOME/Library/Preferences/AWS/profile"' >> "$HOME/Library/Preferences/Shell/sources"
    sort -uo "$HOME/Library/Preferences/Shell/sources" "$HOME/Library/Preferences/Shell/sources"
fi

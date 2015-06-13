#!/bin/bash
#

# Calendar.defaults v1.0.0
# This script sets defaults for Opera 15.
# www.brianspeir.com
#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License. You may not use this file except
# in compliance with the License. You may obtain a copy of the License at
# http://opensource.org/licenses/BSD-3-Clause


# Other -------------------------------------------------------------------- #

# Don't ask to set Opera as the defualt browser.
# Enable developer tools.
# Block all plug-ins.
# Do not use a prediction service to help complete searches and URLs typed in the address bar.
# Do not predict network actions to improve page load performance.
# TODO Do not automatically send usage statistics and crash reports to Opera.
# Send a ‘Do Not Track’ request with your browsing traffic.
# Do not offer to save passwords I enter on the web.
# Block sites from setting any data.
# Block third-party cookies and site data.

mkdir -p $HOME/Library/Application\ Support/com.operasoftware.Opera/
cat > "$HOME/Library/Application Support/com.operasoftware.Opera/Preferences" <<'EOF'
{
   "browser": {
      "check_default_browser": false,
      "window_placement": {
         "height": 830,
         "left": 22,
         "top": 44,
         "width": 1000
      }
   },
   "devtools": {
      "disabled": false
   },
   "dns_prefetching": {
      "enabled": false
   },
   "download": {
      "directory_upgrade": true
   },
   "enable_do_not_track": true,
   "extensions": {
      "alerts": {
         "initialized": true
      },
      "autoupdate": {
         "next_check": "13018508363156694"
      },
      "last_opera_version": "15.0.1147.138",
      "settings": {
         "bcibcaaakpeekhbnddgnajbmjdcemfkf": {
            "active_permissions": {
               "api": [ "addonsPrivate", "management" ]
            },
            "app_launcher_ordinal": "n",
            "creation_flags": 1,
            "from_bookmark": false,
            "from_webstore": false,
            "install_time": "13018508063962000",
            "location": 5,
            "manifest": {
               "app": {
                  "launch": {
                     "web_url": "https://addons.opera.com/"
                  },
                  "urls": [ "https://addons.opera.com/" ]
               },
               "description": "Opera Addons Portal",
               "key": "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDAbTKr4g11sfL12IByl8cC1NThF3SIMBhYJlyF4vYe0RhuAztV06xdKladCVB3msDBaKfZwPF/+tgBIly76R/X4XiFyNeD01Tb4XYy8iBohVh8/ZP8c93OVTZ+0pTGE10UUjqtBPtcs6q2kz5z9eZ4LLCl2RX6/Kf8h6vsjuigUQIDAQAB",
               "manifest_version": 2,
               "name": "Opera Addons Portal",
               "permissions": [ "addonsPrivate", "management" ],
               "version": "1"
            },
            "page_ordinal": "n",
            "path": "/Applications/Opera.app/Contents/Versions/15.0.1147.138/Opera Framework.framework/Resources/opera_addons",
            "was_installed_by_default": false
         }
      }
   },
   "plugins": {
      "removed_old_component_pepper_flash_settings": true
   },
   "profile": {
      "block_third_party_cookies": true,
      "content_settings": {
         "clear_on_exit_migrated": true,
         "pref_version": 1,
         "whitelist_version": 1
      },
      "default_content_settings": {
         "cookies": 2,
         "plugins": 2
      },
      "password_manager_enabled": false
   },
   "search": {
      "suggest_enabled": false
   },
   "turbo": {
      "client_id": "718f78153b352671855d8c1a037536d702aa2c35a218603a1c5dc352a0f6540c"
   }
}
EOF

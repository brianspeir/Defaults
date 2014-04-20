#!/bin/bash
#

# SublimeText.defaults v1.0.0
# This script sets defaults for Sublime Text 2.
# www.brianspeir.com
#
# Copyright (C) 2013 Brian Speir. All rights reserved.
#
# Licensed under The BSD 3-Clause License. You may not use this file except
# in compliance with the License. You may obtain a copy of the License at
# http://opensource.org/licenses/BSD-3-Clause


# Dependencies ------------------------------------------------------------- #

# Install Source Code Pro fonts.
if [[ ! -r "$HOME/Library/Fonts/SourceCodePro-Regular.otf" ]]; then
    bash <(curl -s https://raw.github.com/brianspeir/Bundles/master/Fonts.install)
fi

# Make the directory structure if it doesn't exist.
mkdir -p "$HOME/Library/Application Support/Sublime Text 2/Packages/User/"

# Preferences -------------------------------------------------------------- #

# User settings.
cat > "$HOME/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings" <<'EOF'
// Sublime Text settings for Brian Speir.
//
// Settings in here override those in "Default/Preferences.sublime-settings", and
// are overridden in turn by file type specific settings.
{
    // Sets the colors used within the text area
    "color_scheme": "Packages/User/Espresso Soda.tmTheme",

    // Fonts
    "font_face": "Source Code Pro",
    "font_size": 12,

    // Valid options are "no_bold", "no_italic", "no_antialias", "gray_antialias",
    // "subpixel_antialias", "no_round" (OS X only) and "directwrite" (Windows only)
    "font_options": ["subpixel_antialias"],


    // Columns in which to display vertical rulers
    // Set to 79 per Style Guide for Python Code
    "rulers": [72,79,84,99],

    // Set to true to turn spell checking on by default
    "spell_check": false,

    // The number of spaces a tab is considered equal to
    "tab_size": 4,

    // Set to true to insert spaces when tab is pressed
    "translate_tabs_to_spaces": true,

    // If translate_tabs_to_spaces is true, use_tab_stops will make tab and
    // backspace insert/delete up to the next tabstop
    "use_tab_stops": true,

    // Calculates indentation automatically when pressing enter
    "auto_indent": true,

    // Makes auto indent a little smarter, e.g., by indenting the next line
    // after an if statement in C. Requires auto_indent to be enabled.
    "smart_indent": true,

    // Adds whitespace up to the first open bracket when indenting. Requires
    // auto_indent to be enabled.
    "indent_to_bracket": true,

    // Disables horizontal scrolling if enabled.
    // May be set to true, false, or "auto", where it will be disabled for
    // source code, and otherwise enabled.
    "word_wrap": "false",

    // Set to a value other than 0 to force wrapping at that column rather than the
    // window width
    "wrap_width": 79,

    // Set to "none" to turn off drawing white space, "selection" to draw only the
    // white space within the selection, and "all" to draw all white space
    "draw_white_space": "all",

    // Set to true to removing trailing white space on save
    "trim_trailing_white_space_on_save": true,

    // Set to true to ensure the last line of the file ends in a newline
    // character when saving
    "ensure_newline_at_eof_on_save": true,

    // By default, auto complete will commit the current completion on enter.
    // This setting can be used to make it complete on tab instead.
    // Completing on tab is generally a superior option, as it removes
    // ambiguity between committing the completion and inserting a newline.
    "auto_complete_commit_on_tab": true,

    //
    // User Interface Settings
    //

    // The theme controls the look of Sublime Text's UI (buttons, tabs, scroll bars, etc)
    "theme": "Soda Light.sublime-theme",

    // Makes tabs with modified files more visible
    "highlight_modified_tabs": true,

    //
    // Application Behavior Settings
    //

    // folder_exclude_patterns and file_exclude_patterns control which files
    // are listed in folders on the side bar. These can also be set on a per-
    // project basis.
    "folder_exclude_patterns": [".svn", ".git", ".hg", "CVS"],
    "file_exclude_patterns": ["*.pyc", "*.pyo", "*.exe", "*.dll", "*.obj","*.o", "*.a", "*.lib", "*.so", "*.dylib", "*.ncb", "*.sdf", "*.suo", "*.pdb", "*.idb", ".DS_Store", "*.class", "*.psd", "*.db"],

    // These files will still show up in the side bar, but won't be included in
    // Goto Anything or Find in Files
    "binary_file_patterns": ["*.jpg", "*.jpeg", "*.png", "*.gif", "*.ttf", "*.tga", "*.dds", "*.ico", "*.eot", "*.pdf", "*.swf", "*.jar", "*.zip", ".gitignore"],

    // List any packages to ignore here. When removing entries from this list,
    // a restart may be required if the package contains plugins.
    "ignored_packages": ["Vintage"]
}
EOF

# Package control settings. Will automatically install missing packages.
cat > "$HOME/Library/Application Support/Sublime Text 2/Packages/User/Package Control.sublime-settings" <<'EOF'
{
    // If package install, upgrade and removal info should be submitted to
    // the channel for aggregated statistics
    "submit_usage": false,

    "installed_packages":
    [
        "Package Control",
        "Theme - Soda",
        "SublimeLinter",
        "HTML5",
        "SCSS",
        "Python Flake8 Lint",
        "Restructured Text (RST) Snippets",
        "GitGutter"
    ]
}
EOF

# Flake 8 Lint settings.
cat > "$HOME/Library/Application Support/Sublime Text 2/Packages/User/Flake8Lint.sublime-settings" <<'EOF'
{
    // debug mode (verbose output to ST python console)
    "debug": false,

    // run flake8 lint on file saving
    "lint_on_save": true,
    // run flake8 lint on file loading
    "lint_on_load": false,

    // popup a dialog of detected conditions?
    "popup": false,
    // highlight detected conditions?
    "highlight": true,

    // show a mark in the gutter on all lines with errors/warnings:
    // - "dot", "circle" or "bookmark" to show marks
    // - "" (empty string) to do not show marks
    "gutter_marks": "dot",

    // report successfull (passed) lint
    "report_on_success": false,

    // load global flake8 config ("~/.config/flake8")
    "use_flake8_global_config": true,
    // load per-project config (i.e. "tox.ini", "setup.cfg" and ".pep8" files)
    "use_flake8_project_config": false,

    // set python interpreter (lint files for python >= 2.7):
    // - 'internal' for use internal Sublime Text 2 interpreter (2.6)
    // - 'auto' for search default system python interpreter (default value)
    // - absolute path to python interpreter for define another one
    //   use platform specific notation, i.e. "C:\\Anaconda\\envs\\py33\\python.exe"
    //   for Windows or then "/home/whatever/pythondist/python" for Unix
    "python_interpreter": "auto",

    // list of python built-in functions (like '_')
    "builtins": [],

    // turn on pyflakes error lint
    "pyflakes": true,
    // turn on pep8 error lint
    "pep8": true,
    // turn off complexity check (set number > 0 to check complexity level)
    "complexity": 10,

    // set desired max line length
    "pep8_max_line_length": 84,

    // select errors and warnings (e.g. ["E", "W6"])
    "select": [],
    // skip errors and warnings (e.g. ["E303", E4", "W"])
    "ignore": [],

    // files to ignore, for example: ["*.mako", "test*.py"]
    "ignore_files": []
}
EOF

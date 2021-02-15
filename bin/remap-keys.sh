#!/usr/bin/env bash
# To run at startup:
# sudo defaults write com.apple.loginwindow LoginHook `pwd`/remap-keys.sh

# https://developer.apple.com/library/content/technotes/tn2450/_index.html
# to see existing settings:
# hidutil property --get "UserKeyMapping"

CAPS_LOCK="0x700000039"
LEFT_CTL="0x7000000E0"
FROM="\"HIDKeyboardModifierMappingSrc\""
TO="\"HIDKeyboardModifierMappingDst\""

hidutil property --set "{\"UserKeyMapping\":[
{$FROM: $CAPS_LOCK,                      $TO: $LEFT_CTL}
]}"

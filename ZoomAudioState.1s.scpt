#!/usr/bin/osascript
#
# This script is a derivative of the work of Dave Look and Nick Turner, who
# wanted to have their Zoom meetings' status reflected in the MacOS menubar.
#
# It is a SwiftBar plug-in:  https://github.com/swiftbar/SwiftBar
#
# It uses the Apple "SF Symbols" font to draw the icons, so you'll need to
# install that from here:  https://developer.apple.com/sf-symbols/

# <bitbar.title>Zoom Audio State</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Gabe Schuyler</bitbar.author>
# <bitbar.author.github>gabe-sky</bitbar.author.github>
# <bitbar.desc>Indicates whether your mic is muted or not, in Zoom.</bitbar.desc>
# <bitbar.dependencies>Applescript</bitbar.dependencies>

# <swiftbar.hideAbout>true</swiftbar.hideAbout>
# <swiftbar.hideRunInTerminal>true</swiftbar.hideRunInTerminal>
# <swiftbar.hideLastUpdated>true</swiftbar.hideLastUpdated>
# <swiftbar.hideDisablePlugin>true</swiftbar.hideDisablePlugin>
# <swiftbar.hideSwiftBar>true</swiftbar.hideSwiftBar>


if application "zoom.us" is running then
  tell application "System Events"
    tell application process "zoom.us"
      if exists (menu bar item "Meeting" of menu bar 1) then
        if exists (menu item "Mute Audio" of menu 1 of menu bar item "Meeting" of menu bar 1) then
          set returnValue to ":mic.fill: | sfcolor=#5d9657 | symbolize=True"
        else
          set returnValue to ":mic.slash.fill: | sfcolor=#cf2323 | symbolize=True"
        end if
      else
        set returnValue to ":mic: | sfcolor=#676f87 | symbolize=True"
      end if
    end tell
  end tell
else
  set returnValue to ":mic: | sfcolor=#8c8c8c | symbolize=True"
end if

return returnValue & "| size=14"

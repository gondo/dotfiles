#!/usr/bin/env bash

###############################################################################
# Google Chrome & Google Chrome Canary                                        #
# TODO: maybe, once Chrome installed
###############################################################################

if open -Ra "Google Chrome"; then

    # Disable the all too sensitive backswipe on trackpads
    defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
    defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

    # Disable the all too sensitive backswipe on Magic Mouse
    defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
    defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false

    # Use the system-native print preview dialog
    defaults write com.google.Chrome DisablePrintPreview -bool true
    defaults write com.google.Chrome.canary DisablePrintPreview -bool true

    # Expand the print dialog by default
    defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true

    # Always show full URL in address bar, including https://.
    defaults write com.google.Chrome ShowFullURLsInAddressBar -bool true

    echo "Chrome needs restart"
else
    echo "Google Chrome is not installed yet."
fi


###############################################################################
# Transmission.app                                                            #
###############################################################################

if open -Ra "Transmission"; then

    # Use `~/Documents/Torrents` to store incomplete downloads
    defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
    defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Documents/Torrents"

    # Use `~/Downloads` to store completed downloads
    defaults write org.m0k.transmission DownloadLocationConstant -bool true

    # Don’t prompt for confirmation before downloading
    defaults write org.m0k.transmission DownloadAsk -bool false
    defaults write org.m0k.transmission MagnetOpenAsk -bool false

    # Don’t prompt for confirmation before removing non-downloading active transfers
    defaults write org.m0k.transmission CheckRemoveDownloading -bool true

    # Trash original torrent files
    defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

    # Hide the donate message
    defaults write org.m0k.transmission WarningDonate -bool false
    # Hide the legal disclaimer
    defaults write org.m0k.transmission WarningLegal -bool false

    # Randomize port on launch
    defaults write org.m0k.transmission RandomPort -bool true

    # Hide search bar to prevent it stealing focus so copy-pasting magneto links works directly after opening the app 
    defaults write org.m0k.transmission FilterBar -bool false
else
    echo "Transmission.app is not installed yet."
fi

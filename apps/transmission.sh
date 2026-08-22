#!/usr/bin/env bash

###############################################################################
# Transmission.app                                                            #
# Pinned on 4.0.6 that doesn't have annoying popups                           #
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

    # Disable annoying and useless notifications about Torrent errors
    defaults write org.m0k.transmission WarningDownloadFailed -bool false
else
    echo "Transmission.app is not installed yet."
fi
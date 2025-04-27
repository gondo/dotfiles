#!/usr/bin/env bash

xcode-select --install

# Update OS
sudo softwareupdate --install --all

if command -v brew >/dev/null 2>&1; then
    echo "Homebrew is installed."

    brew update
    brew upgrade
    brew doctor
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install --formula \
    bat \
    btop \
    curl \
    git \
    go \
    graphicsmagick \
    jq \
    mas \
    node \
    rsync \
    wget

brew install --cask \
    android-studio \
    appcleaner \
    apptrap \
    devcleaner \
    docker \
    easyfind \
    electrum \
    figma \
    firefox \
    goland \
    google-chrome \
    httpie \
    imageoptim \
    iterm2 \
    keycastr \
    rectangle \
    shortcuts \
    spotify \
    sublime-text \
    ticktick \
    thunderbird \
    tor-browser \
    transmission \
    vlc \
    whatsapp \

brew cleanup

# Bandwidth+
mas install 490461369

# Prime Video
mas install 545519333

# SVG Shaper for SwiftUI
mas install 1566140414

# Judo: Design and Build Apps
mas install 1564578427

echo "\n"
echo "⚠️ Install AlexCodes via: https://www.alexcodes.app/"
echo "⚠️ Install Mousecap via: https://github.com/alexzielenski/Mousecape/releases"
echo "\n"


#!/usr/bin/env bash

# Install Xcode line tools
printf "\n Installing command line tools...\n"
xcode-select --install &> /dev/null
until $(xcode-select --print-path &> /dev/null); do
  sleep 5;
done
sudo xcode-select --reset

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

brew analytics off

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
    chatgpt \
    devcleaner \
    docker \
    easyfind \
    electrum \
    figma \
    firefox \
    ghostty \
    goland \
    google-chrome \
    hex-fiend \
    httpie \
    imageoptim \
    iterm2 \
    keycastr \
    libpq \
    rectangle \
    shotcut \
    spotify \
    sublime-text \
    ticktick \
    thunderbird \
    tor-browser \
    transmission \
    vlc \
    whatsapp \

# Linking Postgresql keg (not installing the whole DB, that should be run in container)
brew link --force libpq

brew cleanup

# Bandwidth+
mas install 490461369

# Prime Video
mas install 545519333

# SVG Shaper for SwiftUI
mas install 1566140414

# Judo: Design and Build Apps
mas install 1564578427

# Oh my zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Oh My Zsh not found. Installing..."

  RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh is already installed."
fi

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

# zsh-bat. requires `bat` to be installed
git clone https://github.com/jeffreytse/zsh-bat.git ~/.zsh/zsh-bat
echo "source ~/.zsh/zsh-bat/zsh-bat.plugin.zsh" >> ~/.zshrc

# zsh-completions
git clone https://github.com/zsh-users/zsh-completions ~/.zsh/zsh-completions
echo "fpath+=~/.zsh/zsh-completions" >> ~/.zshrc

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
echo "source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

# zsh: apply changes
source ~/.zshrc

# git
git config --global user.name=gondo
git config --global user.email=331103+gondo@users.noreply.github.com
git config --global init.defaultBranch main
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

echo "\n"
echo "⚠️ Install AlexCodes via: https://www.alexcodes.app/"
echo "⚠️ Install Mousecap via: https://github.com/alexzielenski/Mousecape/releases"
echo "\n"


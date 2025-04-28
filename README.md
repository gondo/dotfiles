# gondo's dotfiles

1. Programatic macOS setup: `./macos.sh`
2. Follow manual macOS setup: `manual-setup.md`
3. Install tools + apps: `./tools.sh`
4. Programatic apps setup: `./apps-setup.sh`


## Git
`./apps/git.sh`


## SSH
```
mkdir ~/.ssh
mkdir ~/.ssh/tmp
cd ~/.ssh

cp ./apps/ssh.config ~/.ssh/config
chmod 600 ~/.ssh/config
```

Github SSH key
```
ssh-keygen -t ed25519 -C "github"
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/github-macbook-m4

# copy public key and add it to https://github.com/settings/keys as both Authentication and Signing key
pbcopy < ~/.ssh/github-macbook-m4.pub

# test connection
ssh -T git@github.com
```

Auto-clean old SSH sockets
```
echo -e '\n# Clean old SSH control sockets older than 1 day\nmkdir -p ~/.ssh/tmp && find ~/.ssh/tmp -type s -mtime +1 -delete' >> ~/.zshrc
source ~/.zshrc
```


## Sublime Text
```
cp ./apps/preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text/Packages/User/Preferences.sublime-settings
```

Prevent license check:
```
sudo vi /etc/hosts
127.0.0.1   license.sublimehq.com
sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
```


## iTerm2
```
cp ./apps/com.googlecode.iterm2.plist ~/Library/Preferences/
killall iTerm2
```


# TODO:

Move Documents
Move Keychains
Setup Thunderbird accounts


# gondo's dotfiles

1. Programatic macOS setup: `./macos.sh`
2. Follow manual macOS setup: `manual-setup.md`
3. Install tools + apps: `./tools.sh`
4. Programatic apps setup: `./apps-setup.sh`


## Git
`./apps/git.sh`


## ZSH
Review `~/.zshrc`
Create and copy `~/.zshenv`, `~/.zprofile`, `~/.zlogin` (no linking needed, auto recognised by ZSH)
`source ~/.zshrc`


## SSH
```
mkdir ~/.ssh
mkdir ~/.ssh/tmp
cd ~/.ssh

cp ./apps/ssh.config ~/.ssh/config
chmod 600 ~/.ssh/config
```

### GitHub SSH key
```
ssh-keygen -t ed25519 -C "hi@michalgondar.com" -f ~/.ssh/github
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/github

# copy public key and add it to https://github.com/settings/keys as both Authentication and Signing key
pbcopy < ~/.ssh/github.pub

# test connection
ssh -T git@github.com
```

Add to `~/.ssh/config`:
```
Host github.com
    IdentityFile ~/.ssh/github
    IdentitiesOnly yes
    HostName github.com
    User git
```

### GitLab SSH key
```
ssh-keygen -t ed25519 -C "hi@michalgondar.com" -f ~/.ssh/gitlab
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/gitlab

# copy public key and add it to https://gitlab.com/-/user_settings/ssh_keys as both Authentication and Signing key
pbcopy < ~/.ssh/gitlab

ssh -T git@gitlab.com
```

Add to `~/.ssh/config`:
```
Host gitlab.com
    IdentityFile ~/.ssh/gitlab
    IdentitiesOnly yes
    HostName gitlab.com
    User git
```

### Clean-up

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


## Manually migrate keychains
Copy `.keychain-db` files from `~/Library/Keychains/` to new computer to `~/Library/Keychains/custom/`
On new computer open `Keychain Access.app`, File → Add Keychain... and add all one by one.


## Electrum
Migrate wallt `~/.electrum/wallets`.


## Documents
Migrate `~/Documents`, `~/Developer`


## Mail
Setup Thunderbird or Mail accounts.
Mail have issues with aliasses but give it a go.


## GoLand
Auto sync via:
GoLand → Preferences → Settings Sync → Enable Settings Sync

Or manually copy config directory
`~/Library/Application Support/JetBrains/GoLand<year.version>/`
List installed plugins:
`ls ~/Library/Application\ Support/JetBrains/GoLand<year.version>/plugins/ | sort`

JetBrains HTTP Client CLI
```
brew 
cd /tmp
curl -f -L -o ijhttp.zip "https://jb.gg/ijhttp/latest"
unzip -q ijhttp.zip
chmod +x ijhttp/ijhttp
sudo mv ijhttp /usr/local/
sudo ln -sf /usr/local/ijhttp/ijhttp /usr/local/bin/ijhttp
rm -rf ijhttp.zip
```







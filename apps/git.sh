#!/usr/bin/env bash

# Git global config

git config --global user.name "gondo"
git config --global user.email "331103+gondo@users.noreply.github.com"
git config --global credential.helper osxkeychain
git config --global user.signingkey /Users/gondo/.ssh/github-macbook-m4.pub
git config --global core.excludesfile ~/.gitignore_global
git config --global core.ignorecase true
git config --global core.editor vi
git config --global init.defaultbranch main
git config --global commit.gpgsign true
git config --global gpg.format ssh
git config --global url.ssh://git@gitlab.com/.insteadof https://gitlab.com/
git config --global url.ssh://git@bitbucket.org/.insteadof https://bitbucket.org/
git config --global url.git@github.com:.insteadof https://github.com/
git config --global url.git@bitbucket.org:.insteadof https://bitbucket.org/
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
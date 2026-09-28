# Lid awake script

Make the macbook run ecen with the closed lid.


## Run

`sudo ./install.sh`


## Manual sleep

Creates shut down (sd) alias and disable sudo requirement to run it.

```
echo "alias sd='sudo pmset -a disablesleep 0 && pmset sleepnow'" >> ~/.zshrc && source ~/.zshrc
echo "$(whoami) ALL=(root) NOPASSWD: /usr/bin/pmset -a disablesleep 0" > /tmp/pmset-sleep \
  && sudo visudo -cf /tmp/pmset-sleep \
  && sudo install -o root -g wheel -m 440 /tmp/pmset-sleep /etc/sudoers.d/pmset-sleep
```


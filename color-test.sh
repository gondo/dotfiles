#!/bin/bash
for i in {0..255}
do
    colors="$colors $(tput setaf $i)$i ██████"
done
echo $colors
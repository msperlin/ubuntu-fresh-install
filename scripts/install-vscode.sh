#!/bin/bash

f_name="vscode_latest.deb"
wget -O "$f_name" 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'

sudo dpkg -i "$f_name"
rm "$f_name"

#!/usr/bin/env bash
set -ex

wget -q https://github.com/obsidianmd/obsidian-releases/releases/download/v1.5.3/obsidian_1.5.3_amd64.deb -O obsidian.deb
apt install -y ./obsidian.deb
sed -i 's#/opt/Obsidian/obsidian#/opt/Obsidian/obsidian --no-sandbox##' /usr/share/applications/obsidian.desktop
cp /usr/share/applications/obsidian.desktop $HOME/Desktop
chmod +x $HOME/Desktop/obsidian.desktop
chown 1000:1000 $HOME/Desktop/obsidian.desktop
rm obsidian.deb

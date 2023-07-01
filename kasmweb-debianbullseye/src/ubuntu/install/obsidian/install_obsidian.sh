#!/usr/bin/env bash
set -ex
ARCH=$(arch | sed 's/aarch64/arm64/g' | sed 's/x86_64/x64/g')
wget -q https://github.com/obsidianmd/obsidian-releases/releases/download/v1.3.5/obsidian_1.3.5_amd64.deb -O obsidian.deb
apt install -y ./obsidian.deb
sed -i 's#/opt/Obsidian/obsidian#/opt/Obsidian/obsidian --no-sandbox##' /usr/share/applications/obsidian.desktop
cp /usr/share/applications/obsidian.desktop $HOME/Desktop
chmod +x $HOME/Desktop/obsidian.desktop
chown 1000:1000 $HOME/Desktop/obsidian.desktop
rm obsidian.deb

# Cleanup
if [ -z ${SKIP_CLEAN+x} ]; then
  apt-get autoclean
  rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/*
fi

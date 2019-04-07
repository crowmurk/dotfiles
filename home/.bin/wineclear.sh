#!/usr/bin/bash

rm -rf ~/.wine

rm -f ~/.config/menus/applications-merged/wine*
rm -rf ~/.local/share/applications/wine
rm -f ~/.local/share/desktop-directories/wine*
rm -f ~/.local/share/icons/????_*.{xpm,png}
rm -f ~/.local/share/icons/*-x-wine-*.{xpm,png}

rm -f ~/.local/share/mime/packages/x-wine*
rm -f ~/.local/share/applications/wine-extension*
rm -f ~/.local/share/icons/hicolor/*/*/application-x-wine-extension*
rm -f ~/.local/share/mime/application/x-wine-extension*

rm -f /home/varga/.local/share/applications/mimeinfo.cache

#!/usr/bin/env bash

# -b - for backup
# -r - to restore desktop icons position

DIR_BACKUP=~/.config/xfce4/desktop.backup
DIR_REPLACE=~/.config/xfce4/desktop

if [ $1 = "-b" ]; then
    # — backup —
    mkdir -p $DIR_BACKUP
    cp -f $DIR_REPLACE/icons* $DIR_BACKUP
    notify-send -i dialog-information-symbolic "`date +%Y.%m.%d\ %H:%M:%S`" "Icons position backuped!"
fi

if [ $1 = "-r" ]; then
    # — restore —
    cp -f $DIR_BACKUP/icons* $DIR_REPLACE
    xfdesktop -R
    notify-send -i dialog-information-symbolic "`date +%Y.%m.%d\ %H:%M:%S`" "Icons position restored!"
fi


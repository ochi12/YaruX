#!/usr/bin/bash

GLOBAL_ICONS="/usr/share/icons"
LOCAL_ICONS="$HOME/.local/share/icons"

if ! test -d $GLOBAL_ICONS/Yaru -o -d $LOCAL_ICONS/Yaru; then
  echo "YaruX is designed as part of Yaru inheritance but yaru-icon-theme is not installed"
fi 

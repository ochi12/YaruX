GLOBAL_ICONS="/usr/share/icons/"
LOCAL_ICONS="$HOME/.local/share/icons/"

YARU_INDEX="/usr/share/icons/Yaru/index.theme"

is_user=$1

if [ "$is_user" = "--user" ]; then
  if test -d "$LOCAL_ICONS/YaruX"; then
    rm -r "$LOCAL_ICONS/YaruX"
    echo "---------------------------------------------"
    echo " Removed local YaruX install..."
    echo "---------------------------------------------"
  fi

elif [ "$is_user" = "" ]; then
  echo
  echo "No --user param: Defaulting to system uninstallation "
  echo
  if test -d "$GLOBAL_ICONS/YaruX"; then
    sudo rm -r "$GLOBAL_ICONS/YaruX"
    echo "---------------------------------------------"
    echo " Removed global YaruX install..."
    echo "---------------------------------------------"
    echo
  fi
else 
  echo "only --user on no parameter is allowed."
  exit 0
fi

echo
echo


echo "Reverting to original Yaru/index.theme"
echo

sudo sed -i -e "s/Inherits=YaruX,/Inherits=/g" "$YARU_INDEX"

echo "RESULT AFTER:"
cat $YARU_INDEX | grep "Inherits"













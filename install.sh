GLOBAL_ICONS="/usr/share/icons/"
LOCAL_ICONS="$HOME/.local/share/icons/"

YARU_INDEX="/usr/share/icons/Yaru/index.theme"

is_user=$1

if [ "$is_user" = "--user" ]; then
  if test -d "$LOCAL_ICONS/YaruX"; then
    rm -r "$LOCAL_ICONS/YaruX"
    echo "---------------------------------------------"
    echo " Removed old YaruX install..."
    echo "---------------------------------------------"
  fi

  cp -r "YaruX/" "$LOCAL_ICONS"
  echo "Successfully installed YaruX for current user."

elif [ "$is_user" = "" ]; then
  echo
  echo "No --user param: Defaulting to system installation "
  echo
  if test -d "$GLOBAL_ICONS/YaruX"; then
    sudo rm -r "$GLOBAL_ICONS/YaruX"
    echo "---------------------------------------------"
    echo " Removed old YaruX install..."
    echo "---------------------------------------------"
    echo
  fi
  sudo cp -r "YaruX/" "$GLOBAL_ICONS"
  echo "Successfully installed YaruX system wide."
else 
  echo "only --user on no parameter is allowed."
  exit 0
fi

echo
echo


echo "Editing Yaru/index.theme to make Yaru inherit YaruX."

sudo sed -i -e "s/Inherits=YaruX,/Inherits=/g" "$YARU_INDEX"

echo "Yaru/index.theme edited Successfully"
echo
echo "BEFORE":
cat $YARU_INDEX | grep "Inherits"

sudo sed -i -e "s/Inherits=/Inherits=YaruX,/g" "$YARU_INDEX"


echo
echo "AFTER:"
cat $YARU_INDEX | grep "Inherits"













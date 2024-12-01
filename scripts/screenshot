#!/bin/sh
mkdir -p $HOME/pictures
FILENAME="$HOME/pictures/$(date +'%Y-%m-%d-%H%M%S_screenshot.png')"
if [ "$1" = fullscreen ]
then
    grim $FILENAME || exit
elif [ "$1" = region ]
then
    grim -g "$(slurp -b 11111b80 -c cba6f7)" $FILENAME || exit
else
    grim -g "$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')" $FILENAME || exit
fi
   
wl-copy < $FILENAME
notify-send "Screenshot" "File saved as $FILENAME\nand copied to clipboard" -t 6000 -i $FILENAME

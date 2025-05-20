# KRICE START
KRICE_PATH="$HOME/.config/krice"
cat ~/.cache/wal/sequences
krice() {
    if [ "$1" = "bg" ] || [ "$1" = "pfp" ]; then
        # If bg
        if [ "$1" = "bg" ]; then
            ffmpeg -y -i "$2" "$KRICE_PATH/bg.png"
            cp "$KRICE_PATH/bg.png" "$KRICE_PATH/wal.png"
            wal -q -i "$2"
            killall hyprpaper
            hyprpaper > /dev/null 2>&1 & disown
            # If pfp
        elif [ "$1" = "pfp" ]; then
            ffmpeg -i $2 -vf "scale='if(gt(a,1),300,-1)':'if(gt(a,1),-1,300)',pad=300:300:(ow-iw)/2:(oh-ih)/2:color=0x00000000" $KRICE_PATH/temp.png
            magick $KRICE_PATH/temp.png \
            \( +clone -alpha extract -blur 0x0 \
            -threshold -1 \
            -fill black -colorize 100% \
            -draw "roundrectangle 0,0,%[fx:w-1],%[fx:h-1],40,40" \
            -fill white -draw "roundrectangle 0,0,%[fx:w-1],%[fx:h-1],40,40" \
            \) \
            -alpha off -compose CopyOpacity -composite $KRICE_PATH/user.png
            rm $KRICE_PATH/temp.png
            rm -f ~/.cache/thumbnails/neofetch/*
            neofetch
        fi
    else
        echo "Usage: krice <bg|pfp> <image>"
        return 1
    fi
}

# Optional profile function
krice-profile() {
  set -a
  # Sources config from inside profile folder
  source $KRICE_PATH/profiles/$1/config
  # Config should look like this:
  #bg="name_here.png"
  #pfp="name_here.png"
  set +a
  # Exports as variables and sets them with krice
  krice bg $KRICE_PATH/profiles/$1/$bg
  krice pfp $KRICE_PATH/profiles/$1/$pfp
}
# Admittedly, a little messed up but it's better than a million if else statements.
KRICE_PATH="$HOME/.config/krice"

declare -A krice_cmds=(
  [bg]=krice_bg
  [pfp]=krice_pfp
  [online]=krice_online
  [profile]=krice_profile
)

krice_bg() {
  rm -f ~/.cache/thumbnails/neofetch/*
  ffmpeg -y -i "$1" "$KRICE_PATH/bg.png"
  cp "$KRICE_PATH/bg.png" "$KRICE_PATH/wal.png"
  wal -q -i "$1"
  killall hyprpaper
  hyprpaper >/dev/null 2>&1 & disown
}

krice_pfp() {
  ffmpeg -i "$1" -vf "scale='if(gt(a,1),300,-1)':'if(gt(a,1),-1,300)',pad=300:300:(ow-iw)/2:(oh-ih)/2:color=0x00000000" $KRICE_PATH/temp.png
  magick $KRICE_PATH/temp.png \
    \( +clone -alpha extract -blur 0x0 \
    -threshold -1 \
    -fill black -colorize 100% \
    -draw "roundrectangle 0,0,%[fx:w-1],%[fx:h-1],40,40" \
    -fill white -draw "roundrectangle 0,0,%[fx:w-1],%[fx:h-1],40,40" \
    \) \
    -alpha off -compose CopyOpacity -composite $KRICE_PATH/user.png
  rm $KRICE_PATH/temp.png
  sleep 0.5
  neofetch
}

krice_online() {
  # expects: krice online <bg|pfp> <image-url>
  if [ "$1" = "bg" ] || [ "$1" = "pfp" ]; then
    curl -o $KRICE_PATH/temp.png "$2"
    krice $1 $KRICE_PATH/temp.png
  else
    echo "Usage: krice online <bg|pfp> <image-url>"
    return 1
  fi
}

krice_profile() {
  # expects: krice profile <profilename>
  local profile="$1"
  if [ -z "$profile" ]; then
    echo "Usage: krice profile <profilename>"
    return 1
  fi

  if [ "$profile" = "random" ]; then
    # List directories only, pick one at random
    profiles=("$KRICE_PATH/profiles"/*)
    dirs=()
    for p in "${profiles[@]}"; do
      [ -d "$p" ] && dirs+=("$(basename "$p")")
    done
    if [ ${#dirs[@]} -eq 0 ]; then
      echo "No profiles found."
      return 1
    fi
    profile="${dirs[RANDOM % ${#dirs[@]}]}"
    echo "Randomly selected profile: $profile"
  fi

  set -a
  source "$KRICE_PATH/profiles/$profile/config"
  set +a
  krice bg "$KRICE_PATH/profiles/$profile/$bg"
  krice pfp "$KRICE_PATH/profiles/$profile/$pfp"
}

krice() {
  local cmd="$1"
  shift
  if [[ -z "$cmd" ]]; then
    echo "Usage: krice <bg|pfp> <image> | krice online <bg|pfp> <image-url> | krice profile <profilename>"
    return 1
  fi
  if [[ -n "${krice_cmds[$cmd]}" ]]; then
    ${krice_cmds[$cmd]} "$@"
  else
    echo "Usage: krice <bg|pfp> <image> | krice online <bg|pfp> <image-url> | krice profile <profilename>"
    return 1
  fi
}
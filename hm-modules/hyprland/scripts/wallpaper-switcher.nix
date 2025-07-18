{ pkgs }:

pkgs.writeShellScript "wallpaper-switcher" ''
  
  DIR=$HOME/nixos/themes/wallpapers/

  wofi_command="wofi --show dmenu \
                        --prompt 'choose..'
                        --width=300 --height=400 \
                        --cache-file=/dev/null \
                        --hide-scroll --no-actions \
                        --define=matching=fuzzy"

  menu(){
  printf "1. dark-cat\n" 
  printf "2. green-cat\n"
  }

  swww query || swww-daemon

  main() {
  choice=$(menu | ''${wofi_command} | cut -d. -f1)
  case $choice in
  1)
      swww img ''${DIR}/dark-cat.png --transition-fps 144 --transition-type any ->
      return
      ;;
  2)
      swww img ''${DIR}/green-cat.png --transition-fps 144 --transition-type any >
      return
      ;;
  esac
  }

  killall -f || main

''

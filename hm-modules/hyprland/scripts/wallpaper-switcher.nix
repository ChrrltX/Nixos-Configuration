{ writeShellScriptBin, pkgs }:

pkgs.writeShellScriptBin "wallpaper-switcher" ''
  
  DIR=$HOME/nixos/themes/wallpapers/

  wofi_command="wofi --show dmenu \
                        --prompt 'choose..'
                        --width=300 --height=400 \
                        --cache-file=/dev/null \
                        --hide-scroll --no-actions \
                        --define=matching=fuzzy"

  menu(){
  printf "1. dark-cat\n" 
  printf "2. white-cat\n"
  printf "3. violet-cat\n"
  printf "4. pink-cat\n"
  printf "5. green-cat\n"
  printf "6. lavender-cat\n"
  printf "7. dark-solid\n"
  printf "8. cherry-blossom\n"
  printf "9. chinese-hills\n"
  printf "10. samurai\n"
  }

  swww query || swww-daemon

  main() {
  choice=$(menu | ''${wofi_command} | cut -d. -f1)
  case $choice in
  1)
      swww img ''${DIR}/dark-cat.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;
  2)
      swww img ''${DIR}/white-cat.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;
  3)
      swww img ''${DIR}/violet-cat.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;
  4)
      swww img ''${DIR}/pink-cat.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;
  5)
      swww img ''${DIR}/green-cat.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;
  6)
      swww img ''${DIR}/lavender-cat.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;
  7)
      swww img ''${DIR}/dark-solid.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;
  8)
      swww img ''${DIR}/cherry-blossom.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;
  9)
      swww img ''${DIR}/chinese-hills.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;
  10)
      swww img ''${DIR}/samurai.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;      
  esac
  }

  killall -f || main

''

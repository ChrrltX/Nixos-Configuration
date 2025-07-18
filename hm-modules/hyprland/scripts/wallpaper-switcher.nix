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
  printf "1. Dark Cat\n" 
  printf "2. White Cat\n"
  printf "3. Violet Cat\n"
  printf "4. Pink Cat\n"
  printf "5. Lavender Cat\n"
  printf "6. Green Cat\n"
  printf "7. Dark Solid\n"
  printf "8. Cherry Blossom\n"
  printf "9. Chinese Hills\n"
  printf "10. Samurai\n"
  printf "11. Koi Fish\n"
  printf "12. Harmony\n"
  printf "13. Orbit Light\n"
  printf "14. Orbit Dark\n"
  printf "15. Galaxy\n"
  printf "16. Starry Sky\n"
  printf "17. Clouds\n"
  printf "18. Nord Shards\n"
  printf "19. Abstract Maze\n"
  printf "20. Nixos Blue\n"
  printf "21. Nixos Blue 2\n"
  printf "22. Nixos Dark\n"
  printf "23. Retro Japanese\n"
  printf "24. Clean Abstract\n"
  printf "25. Kitty-ppuccin Pink\n"
  printf "26. Purple Abstract\n"
  printf "27. Purple Mountains Simple\n"
  printf "28. Purple Desert\n"
  printf "29. Vibe Skeleton\n"
  printf "30. Dark Street\n"
  printf "31. Dark Snowy Street\n"
  printf "32. Fog Forest\n"
  printf "33. Fog Forest 2\n"
  printf "34. Fog Forest 3\n"
  printf "35. Green Ferns\n"
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
      swww img ''${DIR}/lavender-cat.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;
  6)
      swww img ''${DIR}/green-cat.png --transition-fps 144 --transition-type any --transition-duration 3
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
  11)
      swww img ''${DIR}/koi-fish.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;
  12)
      swww img ''${DIR}/harmony.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;
  13)
      swww img ''${DIR}/orbit-light.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;
  14)
      swww img ''${DIR}/orbit-dark.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;      
  15)
      swww img ''${DIR}/galaxy.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;      
  16)
      swww img ''${DIR}/starry-sky.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;
  17)
      swww img ''${DIR}/clouds.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;
  18)
      swww img ''${DIR}/nord-shards.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;      
  19)
      swww img ''${DIR}/abstract-maze.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;      
  20)
      swww img ''${DIR}/nixos-blue.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;
  21)
      swww img ''${DIR}/nixos-blue-2.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;
  22)
      swww img ''${DIR}/nixos-dark.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;      
  23)
      swww img ''${DIR}/retro-japanese.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;      
  24)
      swww img ''${DIR}/clean-abstract.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;      
  25)
      swww img ''${DIR}/kitty-ppuccin-pink.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;      
  26)
      swww img ''${DIR}/purple-abstract.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;      
  27)
      swww img ''${DIR}/purple-mountains-simple.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;      
  28)
      swww img ''${DIR}/purple-desert.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;      
  29)
      swww img ''${DIR}/vibe-skeleton.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;      
  30)
      swww img ''${DIR}/dark-street.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;
  31)
      swww img ''${DIR}/dark-snowy-street.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;
  32)
      swww img ''${DIR}/fog-forest.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;      
  33)
      swww img ''${DIR}/fog-forest-2.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;
  34)
      swww img ''${DIR}/fog-forest-3.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;      
  35)
      swww img ''${DIR}/green-ferns.png --transition-fps 144 --transition-type any --transition-duration 3
      return
      ;;      
  esac
  }

  killall -f || main

''

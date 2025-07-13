{ config, pkgs, lib, ... }:

{
  home-manager.users.chrrltx = { pkgs, ... }: {

    wayland.windowManager.hyprland = {
      
      settings = {
         
        exec-once = "swww-daemon";

      };

    };  

    programs.swww.enable = true;

    home.file.".wallpaper-switcher".text = ''
      
      DIR=$HOME/nixos/themes/wallpapers

      wofi_command="wofi --show dmenu \
      			--prompt 'choose..'
			--width=300 --height=400 \
			--cache-file=/dev/null \
			--hide-scroll --no-actions \
			--define=matching=fuzzy"
      
      menu(){
      printf "1. dark-cat\n"
      printf "2. purple-desert\n"
      }

      swww query || swww-daemon

      main() {
      choice=$(menu | ${wofi_command} | cut -d. -f1)
      case $choice in
      1)
          swww img ${DIR}/dark-cat.png --transition-fps 144 --transition-type any --transition-duration 3
	  return
	  ;;
      2)
          swww img ${DIR}/purple-desert.png --transition-fps 144 --transition-type any --transition-duration 3
          return
          ;;
      esac
      }

      killall -f || main

    '';
  };
}    

{ config, pkgs, lib, ... }:

{
  home-manager.users.chrrltx = { pkgs, ... }: {

    wayland.windowManager.hyprland = {
      
      settings = {
         
	 # Bind Rofi:
        "$menu" = "rofi --show drun";

        bind = [ "$mod, Space, exec, $menu" ];

      };

    };  

    programs.rofi = {

      enable = true;
      package = pkgs.rofi;
      #settings = { };
    
    };

  };
}

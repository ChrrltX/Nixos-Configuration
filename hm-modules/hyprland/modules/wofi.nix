{ config, pkgs, lib, ... }:

{
  home-manager.users.chrrltx = { pkgs, ... }: {

    wayland.windowManager.hyprland = {
      
      settings = {
         
	 # Bind Wofi:
        "$menu" = "wofi --show drun";

        bind = [ "$mod, Space, exec, $menu" ];

      };

    };  

    programs.wofi = {

      enable = true;
      package = pkgs.wofi;
      #settings = { };
    
    };

  };
}

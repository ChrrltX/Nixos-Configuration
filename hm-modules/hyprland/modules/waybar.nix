{ config, pkgs, lib, ... }:

{
  home-manager.users.chrrltx = { pkgs, ... }: {

    wayland.windowManager.hyprland = {
      
      settings = {

        exec-once = "waybar";

      };

    };  

    programs.waybar.enable = true;  

  };  
}

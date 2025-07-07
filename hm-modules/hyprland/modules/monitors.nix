{ config, pkgs, lib, inputs, ... }:

{ 
  home-manager.users.chrrltx = { pkgs, ... }: {
     
     # Hyprland:
    wayland.windowManager.hyprland = {
      settings = {
        
	monitor = [
	   
	   # AOC (Left):
          "DP-3, 2560x1440@144, 0x0, auto"
	   
	   # MSI (Right):
	  "HDMI-A-1, 1920x1080@144, 2560x200, auto"
	
	];
      };
    };
  };  
}

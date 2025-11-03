{ config, pkgs, lib, inputs, ... }:

{ 
  options = {
    lp-monitor.enable = 
      lib.mkEnableOption "enables lp-monitor";
  };
  
  config = lib.mkIf config.lp-monitor.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {
     
       # Hyprland:
      wayland.windowManager.hyprland = {
        settings = {
        
	  monitor = [
	   
	     "eDP-1, 1920x1080@60, 0x0, 1.25"
	
	  ];
        };
      };
    };
  };  
}

{ config, pkgs, lib, inputs, ... }:

let
  wallpaper-switcher = pkgs.callPackage ./scripts/wallpaper-switcher.nix { };
in

{ 
  imports = [

    ./modules/hyprland-conf.nix
    ./modules/monitors.nix
    ./modules/waybar.nix
    ./modules/rofi.nix

  ];  

  options = {
    hyprland.enable =
      lib.mkEnableOption "enables hyprland";
  };    
  
  config = lib.mkIf config.hyprland.enable {

     # Session Variables:
    environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
     
     # Enable Desktop Portals:
    xdg.portal.enable = true;
     
     # Enable Hyprland:
    programs.hyprland = {
      enable = true;
      #package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    };
     
     # Scripts:
    environment.systemPackages = [ wallpaper-switcher ];

    home-manager.users.chrrltx = { pkgs, ... }: {
     
       # Hyprland Configuration:
      wayland.windowManager.hyprland = {
        enable = true;
   
        systemd = {
          enable = true;
          enableXdgAutostart = true;
          variables = ["--all"];
        };
     
        xwayland = {
          enable = true;
        };
      };
       
       # startup:
      wayland.windowManager.hyprland = {
      
        settings = {
         
          exec-once = [ 
	    
	    "swww-daemon"
	    "waybar"
	  
	  ];

        };
      };
    
       # Additional Packages:
      home.packages = with pkgs; [ 
      
        #mako # Notifications
        libnotify # Notifications
	pavucontrol # Audio Controls
	playerctl # Media Controls
	wireplumber # Audio Controls
	wl-clipboard # Clipboard
	swaynotificationcenter
	swww

      ];

    };
  };

}

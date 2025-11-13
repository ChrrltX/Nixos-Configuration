{ config, pkgs, lib, inputs, ... }:

let
  wallpaper-switcher = pkgs.callPackage ./scripts/wallpaper-switcher.nix { };
in

{ 
    imports = [

     # Hyprland Config:
    ./modules/hypr-conf/general.nix
    ./modules/hypr-conf/binds.nix
    ./modules/hypr-conf/animations.nix
    ./modules/hypr-conf/input.nix
    ./modules/hypr-conf/windowrules.nix

     # Plugins:
    ./modules/plugins/dynamic-cursors.nix
    ./modules/plugins/hyprtrails.nix
     
     # Monitors:
    ./modules/monitors/pc-monitors.nix
    ./modules/monitors/lp-monitor.nix

     # Modules:
    ./modules/waybar/waybar.nix
    ./modules/waybar/waybar-2.nix

    ./modules/hyprshell.nix
    ./modules/wofi.nix
    ./modules/screen-tools.nix
    ./modules/hypridle.nix
    ./modules/hyprlock.nix
    #./modules/sunsetr.nix
    ./modules/power-profiles.nix
    ./modules/swaync.nix
    #./modules/hyprdim.nix
    #./modules/hyprpicker.nix
    ./modules/vicinae.nix
    ./modules/wlogout/wlogout.nix

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
            "lxqt-policykit-agent"
            "protonvpn-app"
            "sunsetr"
            "hyprshell run &"
            "swaync"
            "vicinae server"
            "swayosd-server"
            #'' nwg-dock-hyprland -c "wofi --show drun" -x -ml 10 -p "left" ''
	  
   	  ];

        };
      };
    
       # Additional Packages:
      home.packages = with pkgs; [ 
      
        #mako # Notifications
        libnotify # Notifications
        swayosd # OSD
        pavucontrol # Audio Controls
        playerctl # Media Controls
      	wireplumber # Audio Controls
      	wl-clipboard # Clipboard
        brightnessctl # Brightness Control
      	swww
        polkit_gnome
        #dunst

      ];

    };
  };

}


{ config, pkgs, lib, inputs, ... }:

{ 
    # Packages:
   
   # Desktops, Display Managers:
  
  gdm.enable = true;
  sddm.enable = false;

   # Gnome:
  gnome.enable = false;

  #blur-shell.enable = true;
  #forge.enable = true;
  #pano.enable = true;
  #rounded-corners.enable = true;
  #weather.enable = true;
  #bar-organizer.enable = true;
  #transparent-bar.enable = true;
  #unite.enable = true;
  #just-perfection.enable = true;
  #tiling-shell.enable = false;
  #media-controls.enable = true;
  #tray-icons.enable = true;
  #dock.enable = true;
  #caffeine.enable = true;
  #lock-keys.enable = true;
  #runcat.enable = true;

   # Hyprland:
  hyprland.enable = true;
  pc-monitors.enable = true;
  lp-monitor.enable = false;

  dynamic-cursors.enable = true;
  hyprtrails.enable = true;
  
  hypridle.enable = false;
  hyprlock.enable = false;
  #sunsetr.enable = true;
  waybar.enable = false;
  waybar-2.enable = true;

  #services.caelestia-shell.enable = false;

  # Hardware:

  amd.enable = true;
  openrgb.enable = true;

   # Security:
  
  proton-vpn.enable = true;

   # Customization:

  stylix.enable = true;
  plymouth.enable = true;
  bibata-white.enable = true;
  catppuccin-mocha.enable = true;

   # Gaming:
  
  steam.enable = true;
  prismlauncher.enable = true;
  vintage-story.enable = true;
  osu.enable = true;
   
   # Apps:

  brave.enable = true;
  zen-browser.enable = true;
  obsidian.enable = true;
  vesktop.enable = true;
  spotify.enable = true;
  kitty.enable = true;
  virt-manager.enable = true;
  nautilus.enable = true;
  signal.enable = true;
  kde-connect.enable = false;
  blender.enable = true;
  gimp.enable = true;
   
   # CLI:

  fastfetch.enable = true;
  nh.enable = true;
  cava.enable = true;
  btop.enable = true;
  tree.enable = true;
  nvf.enable = true;
  zsh.enable = true;
  fish.enable = true;
  bat.enable = true;
  fzf.enable = true;
  eza.enable = true;
  
  programs.fish.enable = true;

  home-manager.users.chrrltx = { pkgs, ... }: {
    
     # Git:
    programs.git = {
      enable = true;
      userName  = "ChrrltX";
      userEmail = "";
      extraConfig = {
        init.defaultBranch = "main";
      };
    }; 

    home.packages = with pkgs; [ scrcpy gnome-clocks vinegar wineWowPackages.waylandFull winetricks ];
    
    home.username = "chrrltx";

    home.homeDirectory = "/home/chrrltx";
    
    home.stateVersion = "25.05";

  };

}


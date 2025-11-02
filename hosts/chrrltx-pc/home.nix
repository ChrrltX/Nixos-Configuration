
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
  hyprshell.enable = true;
  swaync.enable = true;

  #services.caelestia-shell.enable = false;

  # Hardware:

  amd.enable = true;
  openrgb.enable = true;

   # Security:
  
  proton-vpn.enable = true;

   # Customization:

  stylix.enable = true;
  plymouth.enable = true;

   # Cursors:
  bibata-white.enable = true;
   
   # Themes:
  catppuccin-mocha.enable = false;
  ashes.enable = true;

   # Gaming:
  
  steam.enable = true;
  prismlauncher.enable = true;
  vintage-story.enable = true;
  osu.enable = true;
  roblox.enable = true;
   
   # Apps:

  brave.enable = false;
  zen-browser.enable = true;
  obsidian.enable = true;
  vesktop.enable = true;
  spotify.enable = true;
  kitty.enable = true;
  virt-manager.enable = true;
  scrcpy.enable = true;
  nautilus.enable = true;
  signal.enable = false;
  kde-connect.enable = false;
  blender.enable = true;
  gimp.enable = true;
  nixcord.enable = false;
  gnome-clocks.enable = true;
   
   # CLI:

  fastfetch.enable = true;
  nh.enable = true;
  cava.enable = true;
  btop.enable = true;
  tree.enable = true;
  nvf.enable = true;
  zsh.enable = true;
  bat.enable = true;
  fzf.enable = true;
  eza.enable = true;
  tmux.enable = true;

  home-manager.users.chrrltx = { pkgs, ... }: {
    
     # Git:
    programs.git = {
      enable = true;
      settings = {
        user.name = "ChrrltX";
        user.email = "";
        extraConfig = {
          init.defaultBranch = "main";
        };
      };  
    }; 

    home.packages = with pkgs; [ vscodium lutris cartridges protonmail-desktop ];
    
    home.username = "chrrltx";

    home.homeDirectory = "/home/chrrltx";

    xdg = {
      enable = true;
      desktopEntries = {
        nixos-manual = {
          name = "NixOs Manual";
          exec = "nixos-help";
          noDisplay = true;
        };
      };
    };       
    
    home.stateVersion = "25.05";

  };

}


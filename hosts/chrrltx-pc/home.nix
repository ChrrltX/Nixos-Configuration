
{ config, pkgs, lib, ... }:

{ 
    # Packages:
   
   # Desktops, Display Managers:

  gnome.enable = true;
  
  gdm.enable = true;
  sddm.enable = false;

   # Hyprland:
  hyprland.enable = true;
  pc-monitors.enable = true;
  lp-monitor.enable = false;

  dynamic-cursors.enable = true;
  hyprtrails.enable = true;
  
  hypridle.enable = false;
  hyprlock.enable = false;
  hyprsunset.enable = true;
  waybar.enable = true;
  waybar-2.enable = false;

  services.caelestia-shell.enable = false;

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
  kde-connect.enable = true;
   
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
 
  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-runtime-7.0.20"
  ];

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

    home.packages = with pkgs; [ python3Full ];
    
    home.username = "chrrltx";

    home.homeDirectory = "/home/chrrltx";
    
    home.stateVersion = "25.05";

  };

}


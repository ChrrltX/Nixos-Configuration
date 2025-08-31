
{ config, pkgs, lib, ... }:

{ 
    # Packages:
   
   # Desktops, Display Managers:

  gnome.enable = true;
  hyprland.enable = true;
  
  gdm.enable = true;
  sddm.enable = false;

   # Hardware:

  amd.enable = true;
  openrgb.enable = true;
  pc-monitors.enable = true;
  lp-monitor.enable = false;

   # Security:
  
  proton-vpn.enable = true;
  hypridle.enable = false;
  hyprlock.enable = false;
   
   # QOL:

  hyprsunset.enable = true;

   # Customization:

  stylix.enable = true;
  services.caelestia-shell.enable = false;
  waybar.enable = false;
  waybar-2.enable = true;
  plymouth.enable = true;

   # Gaming:
  
  steam.enable = true;
  prismlauncher.enable = true;
  vintage-story.enable = true;
   
   # Apps:

  brave.enable = true;
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

    #home.packages = with pkgs; [];
    
    home.username = "chrrltx";

    home.homeDirectory = "/home/chrrltx";
    
    home.stateVersion = "25.05";

  };

}


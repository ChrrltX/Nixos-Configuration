
{ config, pkgs, lib, ... }:

{ 
    # Packages:
   
   # Desktops, Display Managers:

  gnome.enable = false;
  hyprland.enable = true;
  
  gdm.enable = true;
  sddm.enable = false;

   # Hardware:

  amd.enable = false;
  lp-monitor.enable = true;
  pc-monitors.enable = false;

   # Customization:

  stylix.enable = true;
  services.caelestia-shell.enable = false;
  waybar.enable = true;
  plymouth.enable = true;

   # Gaming:
  steam.enable = true;
  prismlauncher.enable = true;
   
   # Apps:

  brave.enable = true;
  obsidian.enable = true;
  vesktop.enable = true;
  #spotify.enable = true;
  kitty.enable = true;
  virt-manager.enable = false;
  nautilus.enable = true;
   
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

    #home.packages = with pkgs; [ ];
    
    home.username = "chrrltx";

    home.homeDirectory = "/home/chrrltx";
    
    home.stateVersion = "25.05";

  };

}


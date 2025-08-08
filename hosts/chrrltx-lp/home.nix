
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

   # Themes:
  stylix.enable = true;
  services.caelestia-shell.enable = false;
   
   # Apps:

  steam.enable = true;
  brave.enable = true;
  obsidian.enable = true;
  vesktop.enable = true;
  #spotify.enable = true;
  kitty.enable = true;
  openrgb.enable = false;
  virt-manager.enable = false;
   
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

    home.packages = with pkgs; [

      nautilus

    ];
    
    home.username = "chrrltx";

    home.homeDirectory = "/home/chrrltx";
    
    home.stateVersion = "25.05";

  };

}


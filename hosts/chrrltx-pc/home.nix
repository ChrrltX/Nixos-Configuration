{ config, pkgs, lib, ... }:

{ 
    # Packages:
   
   # Desktops, Display Managers:

  gnome.enable = false;
  hyprland.enable = true;

  sddm.enable = false;

   # Hardware:

  amd.enable = true;

   # Themes:
  stylix.enable = true;
   
   # Apps:

  steam.enable = true;
  brave.enable = true;
  obsidian.enable = true;
  vesktop.enable = true;
  #spotify.enable = true;
  kitty.enable = true;
  openrgb.enable = true;
   
   # CLI:

  neovim.enable = true;
  neofetch.enable = true;
  nh.enable = true;
  cava.enable = true;
  btop.enable = true;
  tree.enable = true;

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
    
    home.username = "chrrltx";

    home.homeDirectory = "/home/chrrltx";
    
    home.stateVersion = "25.05";

  };
}

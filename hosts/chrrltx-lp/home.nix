
{ config, pkgs, lib, ... }:

{ 
    # Packages:
   
   # Desktops, Display Managers:

  gnome.enable = true;
  hyprland.enable = true;
  
  gdm.enable = true;
  sddm.enable = false;

   # Hardware:

  lp-monitor.enable = true;
  bluetooth.enable = true;
   
   # Security:
  
  proton-vpn.enable = true;
  hypridle.enable = true;
  hyprlock.enable = true;

   # QOL:
  
  hyprsunset.enable = true;

   # Customization:

  stylix.enable = true;
  services.caelestia-shell.enable = false;
  waybar.enable = false;
  waybar-2.enable = true;
  plymouth.enable = true;
  bibata-white.enable = true;
  catppuccin-mocha.enable = true;

   # Gaming:
  steam.enable = true;
  prismlauncher.enable = true;
   
   # Apps:
  
  virt-manager.enable = true;
  brave.enable = false;
  zen-browser.enable = true;
  obsidian.enable = true;
  vesktop.enable = true;
  spotify.enable = true;
  kitty.enable = true;
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
  
  #virtualisation.virtualbox.host.enable = true;
  programs.adb.enable = true;

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

    home.packages = with pkgs; [ whois swtpm ];
    
    home.username = "chrrltx";

    home.homeDirectory = "/home/chrrltx";
    
    home.stateVersion = "25.05";

  };

}


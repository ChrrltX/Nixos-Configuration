
{ config, pkgs, lib, inputs, ... }:

{ 
    #\\\\\\\\\\\\\\\\\\\\\
    #--------------------
    # Installed Packages:
    #--------------------
    #/////////////////////
   
   #\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
   # Desktops, Display Managers:
   #/////////////////////////////
   
   # >>> DMs:
   #----------

  gdm.enable = true;
  sddm.enable = false;

   #>>> Gnome:
   #-----------

  gnome.enable = true;
   
   #>>> Gnome Extensions:
   #----------------------

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

   #>>> Hyprland:
   #--------------

  hyprland.enable = true;
  pc-monitors.enable = true;
  lp-monitor.enable = false;
   
   #>>> Hyprland Extensions:
   #-------------------------

  dynamic-cursors.enable = true;
  hyprtrails.enable = true;
  waybar.enable = false;
  waybar-2.enable = true;
  hypridle.enable = false;
  hyprlock.enable = false;
  #sunsetr.enable = true;
  hyprshell.enable = true;
  swaync.enable = true;
  vicinae.enable = true;
  wlogout.enable = true;

  #\\\\\\\\\\\
  # Hardware:
  #///////////
   
   # >>> Drivers:
   #--------------

  amd.enable = true;

   # >>> Other:
   #------------

  openrgb.enable = true;
   
   #\\\\\\\\\\\
   # Security:
   #///////////
   
   #>>> Network:
   #-------------

  proton-vpn.enable = true;
   
   #\\\\\\\\\\\\\\\\
   # Customization:
   #////////////////

   #>>> Enable Styling:
   #--------------------

  stylix.enable = true;
  plymouth.enable = true;

   #>>> Themes:
   #------------

  catppuccin-mocha.enable = true;
  ashes.enable = false;
  mountain.enable = false;
  gruvbox-dark-soft.enable = false;

   #>>> Cursors:
   #-------------

  bibata-white.enable = true;

   #>>> Icons:
   #-----------
  
  papirus.enable = true;

   #\\\\\\\\\\\\\\\
   # Applications:
   #///////////////

   #>>> Common:
   #------------

  brave.enable = false;
  zen-browser.enable = true;
  obsidian.enable = true;
  vesktop.enable = true;
  spotify.enable = true;
  kitty.enable = true;
  nautilus.enable = true;
  signal.enable = false;
  blender.enable = true;

   #>>> Utility:
   #-------------

  virt-manager.enable = true;
  scrcpy.enable = true;
  kde-connect.enable = false;
  gimp.enable = true;
  gnome-clocks.enable = true;
  woomer.enable = true;

   #>>> Gaming:
   #------------

  steam.enable = true;
  prismlauncher.enable = true;
  vintage-story.enable = true;
  osu.enable = true;
  roblox.enable = true;
  cartridges.enable = true;
   
   #>>> CLI:
   #---------

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
  duf.enable = true;
  carbon-now.enable = true;
   
   #\\\\\\\\\\\\\\\\\\\
   #------------------
   # HM Configuration:
   #------------------
   #///////////////////

  home-manager.users.chrrltx = { pkgs, ... }: {
    
     #>>> Git:
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
     
     #>>> Temporary Packages:
    home.packages = with pkgs; [ whois nwg-drawer nwg-dock-hyprland nurl autojump television haskellPackages.sys-auth-smbclient ];
    
     #>>> User:
    home.username = "chrrltx";
    home.homeDirectory = "/home/chrrltx";
     
     #>>> HM Version (!Do Not Touch!):
    home.stateVersion = "25.05";

  };

}


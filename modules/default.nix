{ config, pkgs, lib, inputs, ... }:

{
  imports = [

      #\\\\\\\\\\\
      # Packages:
      #///////////
     
     #>>> Gaming:

    ./packages/gaming/prismlauncher.nix
    ./packages/gaming/vintage-story.nix
    ./packages/gaming/osu.nix
    ./packages/gaming/roblox.nix
    ./packages/gaming/steam.nix
    ./packages/gaming/cartridges.nix
     
     #>>> Media: 

    ./packages/media/brave.nix
    ./packages/media/obsidian.nix
    ./packages/media/vesktop.nix
    ./packages/media/spotify.nix
    ./packages/media/signal.nix
    ./packages/media/zen-browser.nix
     
     #>>> Utility:

    ./packages/utility/kitty.nix
    ./packages/utility/nautilus.nix
    ./packages/utility/kde-connect.nix
    ./packages/utility/blender.nix
    ./packages/utility/gimp.nix
    ./packages/utility/gnome-clocks.nix
    ./packages/utility/woomer.nix

     #>>> CLI:

    ./packages/cli/fastfetch.nix
    ./packages/cli/nh.nix
    ./packages/cli/btop.nix
    ./packages/cli/cava.nix
    ./packages/cli/tree.nix
    ./packages/cli/nvf.nix
    ./packages/cli/zsh.nix
    ./packages/cli/bat.nix
    ./packages/cli/fzf.nix
    ./packages/cli/eza.nix
    ./packages/cli/tmux.nix
    ./packages/cli/duf.nix
    ./packages/cli/carbon-now.nix

      #\\\\\\\\\\\\\\\\\\\
      # Display Managers:
      #///////////////////
    
    ./display-managers/sddm.nix
    ./display-managers/gdm.nix

     
      #\\\\\\\\\\\
      # Desktops:
      #///////////

    ./desktops/gnome/gnome.nix
    ./desktops/hyprland/hyprland.nix

      #\\\\\\\\\\\
      # Security:
      #///////////

    ./security/proton-vpn.nix
    ./security/gnome-polkit.nix
      
      #\\\\\\\\\\\
      # Hardware:
      #///////////
    
    ./hardware/amd.nix
    ./hardware/bluetooth.nix
    ./hardware/openrgb.nix
     
     
      #\\\\\\\\\\\\\\\\\
      # Virtualisation:
      #/////////////////

    ./virtualisation/virt-manager.nix 
    ./virtualisation/scrcpy.nix

  ];  
}

{ config, pkgs, lib, inputs, ... }:

{
  imports = [

     # Desktops:

    ./gnome/gnome.nix
    ./hyprland/hyprland.nix
   
      # Packages:
     
     # Gaming:
    ./packages/gaming/prismlauncher.nix
    ./packages/gaming/vintage-story.nix
    ./packages/gaming/osu.nix
     
     # Media: 

    ./packages/media/brave.nix
    ./packages/media/obsidian.nix
    ./packages/media/vesktop.nix
    ./packages/media/spotify.nix
    ./packages/media/signal.nix
    ./packages/media/zen-browser.nix
     
     # Utility:

    ./packages/utility/kitty.nix
    ./packages/utility/fastfetch.nix
    ./packages/utility/nh.nix
    ./packages/utility/btop.nix
    ./packages/utility/cava.nix
    ./packages/utility/tree.nix
    ./packages/utility/nvf.nix
    ./packages/utility/zsh.nix
    ./packages/utility/bat.nix
    ./packages/utility/fzf.nix
    ./packages/utility/eza.nix
    ./packages/utility/nautilus.nix
    ./packages/utility/kde-connect.nix
    ./packages/utility/blender.nix
    ./packages/utility/gimp.nix
    ./packages/utility/fish.nix

  ];  
}

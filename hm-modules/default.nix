{ config, pkgs, lib, inputs, ... }:

{
  imports = [

     # Desktops:

    ./gnome/gnome.nix
    ./hyprland/hyprland.nix
   
      # Packages:
     
     # Media: 

    ./packages/media/brave.nix
    ./packages/media/obsidian.nix
    ./packages/media/vesktop.nix
    ./packages/media/spotify.nix
     
     # Utility:

    ./packages/utility/neovim.nix
    ./packages/utility/kitty.nix
    ./packages/utility/neofetch.nix
    ./packages/utility/nh.nix
    ./packages/utility/btop.nix
    ./packages/utility/cava.nix
    ./packages/utility/tree.nix

  ];  
}

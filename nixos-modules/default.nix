{ config, pkgs, lib, ... }:

{ 
  imports = [
     
     # Hardware:

    #./hardware/nvidia.nix
    ./hardware/amd.nix

     # Display Managers:
    
    ./display-managers/sddm.nix
    ./display-managers/gdm.nix

     # Packages:

    ./packages/steam.nix
    ./packages/openrgb.nix
  
  ];
}

{ config, pkgs, lib, ... }:

{
  options = {
    sddm.enable = 
      lib.mkEnableOption "enables sddm";
  };
  
  config = lib.mkIf config.sddm.enable {
     
     # Enable SDDM:
    #services.displayManager.sddm = {
      
      #enable = true;
      #wayland.enable = true;
      #autoNumlock = true;
      #theme = "catppuccin-sddm-corners";

    #};

    #environment.systemPackages = with pkgs; [ catppuccin-sddm-corners ];

  };  
}

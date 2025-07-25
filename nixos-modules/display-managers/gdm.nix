{ config, pkgs, lib, ... }:

{
  options = {
    gdm.enable = 
      lib.mkEnableOption "enables gdm";
  };
  
  config = lib.mkIf config.gdm.enable {
     
     # Enable SDDM:
    services.displayManager.gdm = {
      enable = true;
    };
    
  };  
}

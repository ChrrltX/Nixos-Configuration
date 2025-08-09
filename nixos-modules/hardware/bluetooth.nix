{ config, pkgs, lib, ... }:

{
  options = {
    bluetooth.enable = 
      lib.mkEnableOption "enables bluetooth";
  };
  
  config = lib.mkIf config.bluetooth.enable {
     
     # GUI:
    services.blueman.enable = true;
    
    hardware.bluetooth = {
      
      enable = true;
      powerOnBoot = true;
      
      settings = {
        
        General = {

          Enable = "Source,Sink,Media,Socket";
          Experimental = true; # Show Battery Of Bluetooth Devices
        
        };

      };  

    };   

    hardware.pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
    };  

  };  
}

{ config, pkgs, lib, ... }:

{
  options = {
    openrgb.enable = 
      lib.mkEnableOption "enables openrgb";
  };
  
  config = lib.mkIf config.openrgb.enable {

    services.hardware.openrgb.enable = true;
    environment.systemPackages = with pkgs; [ openrgb ];
    services.udev.packages = [ pkgs.openrgb ];
    boot.kernelModules = [ "i2c-dev" ];

  };  
}

{ config, pkgs, lib, ... }:

{
  options = {
    tray-icons.enable = 
      lib.mkEnableOption "enables tray-icons";
  };
  
  config = lib.mkIf config.tray-icons.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      
      home.packages = [ pkgs.gnomeExtensions.tray-icons-reloaded ];

    };

  };  
}

{ config, pkgs, lib, ... }:

{
  options = {
    dock.enable = 
      lib.mkEnableOption "enables dock";
  };
  
  config = lib.mkIf config.dock.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      
      home.packages = [ pkgs.gnomeExtensions.dash-to-dock ];

    };

  };  
}

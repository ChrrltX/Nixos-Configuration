{ config, pkgs, lib, ... }:

{
  options = {
    pano.enable = 
      lib.mkEnableOption "enables pano";
  };
  
  config = lib.mkIf config.pano.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      
      home.packages = [ pkgs.gnomeExtensions.pano ];

    };

  };  
}

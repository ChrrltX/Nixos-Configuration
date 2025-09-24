{ config, pkgs, lib, ... }:

{
  options = {
    rounded-corners.enable = 
      lib.mkEnableOption "enables rounded-corners";
  };
  
  config = lib.mkIf config.rounded-corners.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {

      home.packages = [ pkgs.gnomeExtensions.rounded-corners ];

    };

  };  
}

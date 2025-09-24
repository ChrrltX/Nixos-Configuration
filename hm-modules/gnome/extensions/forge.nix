{ config, pkgs, lib, ... }:

{
  options = {
    forge.enable = 
      lib.mkEnableOption "enables forge";
  };
  
  config = lib.mkIf config.forge.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {

      home.packages = [ pkgs.gnomeExtensions.forge ];

    };

  };  
}

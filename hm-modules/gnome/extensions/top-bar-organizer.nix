{ config, pkgs, lib, ... }:

{
  options = {
    bar-organizer.enable = 
      lib.mkEnableOption "enables bar-organizer";
  };
  
  config = lib.mkIf config.bar-organizer.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {

      home.packages = [ pkgs.gnomeExtensions.top-bar-organizer ];

    };

  };  
}

{ config, pkgs, lib, ... }:

{
  options = {
    runcat.enable = 
      lib.mkEnableOption "enables runcat";
  };
  
  config = lib.mkIf config.runcat.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      
      home.packages = [ pkgs.gnomeExtensions.runcat ];

    };

  };  
}

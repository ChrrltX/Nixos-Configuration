{ config, pkgs, lib, ... }:

{
  options = {
    unite.enable = 
      lib.mkEnableOption "enables unite";
  };
  
  config = lib.mkIf config.unite.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      
      home.packages = [ pkgs.gnomeExtensions.unite ];

    };

  };  
}

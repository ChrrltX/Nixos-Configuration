{ config, pkgs, lib, ... }:

{
  options = {
    just-perfection.enable = 
      lib.mkEnableOption "enables just-perfection";
  };
  
  config = lib.mkIf config.just-perfection.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      
      home.packages = [ pkgs.gnomeExtensions.just-perfection ];

    };

  };  
}

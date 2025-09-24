{ config, pkgs, lib, ... }:

{
  options = {
    transparent-bar.enable = 
      lib.mkEnableOption "enables transparent-bar";
  };
  
  config = lib.mkIf config.transparent-bar.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      
      home.packages = [ pkgs.gnomeExtensions.transparent-top-bar-adjustable-transparency ];

    };

  };  
}

{ config, pkgs, lib, ... }:

{
  options = {
    tiling-shell.enable = 
      lib.mkEnableOption "enables tiling-shell";
  };
  
  config = lib.mkIf config.tiling-shell.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      
      home.packages = [ pkgs.gnomeExtensions.tiling-shell ];

    };

  };  
}

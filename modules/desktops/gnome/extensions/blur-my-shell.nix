{ config, pkgs, lib, ... }:

{
  options = {
    blur-shell.enable = 
      lib.mkEnableOption "enables blur-shell";
  };
  
  config = lib.mkIf config.blur-shell.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {

      home.packages = [ pkgs.gnomeExtensions.blur-my-shell ];
      
    };

  };  
}

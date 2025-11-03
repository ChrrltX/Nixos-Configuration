{ config, pkgs, lib, ... }:

{
  options = {
    caffeine.enable = 
      lib.mkEnableOption "enables caffeine";
  };
  
  config = lib.mkIf config.caffeine.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      
      home.packages = [ pkgs.gnomeExtensions.caffeine ];

    };

  };  
}

{ config, pkgs, lib, ... }:

{
  options = {
    waypaper.enable = 
      lib.mkEnableOption "enables waypaper";
  };
  
  config = lib.mkIf config.waypaper.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ waypaper ];
    };

  };  
}

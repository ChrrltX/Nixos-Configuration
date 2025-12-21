{ config, pkgs, lib, ... }:

{
  options = {
    easyeffects.enable = 
      lib.mkEnableOption "enables easyeffects";
  };
  
  config = lib.mkIf config.easyeffects.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ easyeffects ];
    };

  };  
}

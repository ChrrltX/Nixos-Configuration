{ config, pkgs, lib, ... }:

{
  options = {
    bat.enable = 
      lib.mkEnableOption "enables bat";
  };

  config = lib.mkIf config.bat.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ bat ];
    };

  };  
}

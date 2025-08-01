{ config, pkgs, lib, ... }:

{
  options = {
    eza.enable = 
      lib.mkEnableOption "enables eza";
  };

  config = lib.mkIf config.eza.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ eza ];
    };

  };  
}

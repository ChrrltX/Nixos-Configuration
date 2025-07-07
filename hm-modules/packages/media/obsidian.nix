{ config, pkgs, lib, ... }:

{
  options = {
    obsidian.enable = 
      lib.mkEnableOption "enables obsidian";
  };

  config = lib.mkIf config.obsidian.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ obsidian ];
    };

  };  
}

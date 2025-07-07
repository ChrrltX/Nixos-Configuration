{ config, pkgs, lib, ... }:

{ 
  options = {
    spotify.enable = 
      lib.mkEnableOption "enables spotify";
  };

  config = lib.mkIf config.spotify.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ spotify ];
    };

  };  
}

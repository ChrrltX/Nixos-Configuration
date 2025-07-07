{ config, pkgs, lib, ... }:

{
  options = {
    neofetch.enable = 
      lib.mkEnableOption "enables neofetch";
  };

  config = lib.mkIf config.neofetch.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ neofetch ];
    };

  };  
}

{ config, pkgs, lib, ... }:

{
  options = {
    swaync.enable = 
      lib.mkEnableOption "enables swaync";
  };
  
  config = lib.mkIf config.swaync.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ swaync ];
    };

  };  
}


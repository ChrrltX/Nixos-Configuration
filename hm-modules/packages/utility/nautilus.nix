{ config, pkgs, lib, ... }:

{
  options = {
    nautilus.enable = 
      lib.mkEnableOption "enables nautilus";
  };

  config = lib.mkIf config.nautilus.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ nautilus ];
    };

  };  
}

{ config, pkgs, lib, ... }:

{
  options = {
    cava.enable = 
      lib.mkEnableOption "enables cava";
  };

  config = lib.mkIf config.cava.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ cava ];
    };

  };  
}

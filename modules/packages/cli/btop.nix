{ config, pkgs, lib, ... }:

{
  options = {
    btop.enable = 
      lib.mkEnableOption "enables btop";
  };

  config = lib.mkIf config.btop.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ btop ];
    };

  };  
}

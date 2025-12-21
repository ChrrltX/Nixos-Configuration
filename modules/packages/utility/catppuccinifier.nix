{ config, pkgs, lib, ... }:

{
  options = {
    catppuccinifier.enable = 
      lib.mkEnableOption "enables catppuccinifier";
  };
  
  config = lib.mkIf config.catppuccinifier.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ catppuccinifier-gui ];
    };

  };  
}

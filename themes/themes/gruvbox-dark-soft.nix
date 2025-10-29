{ config, pkgs, lib, ... }:

{ 
  options = {
    gruvbox-dark-soft.enable = 
      lib.mkEnableOption "enables gruvbox-dark-soft";
  };
  
  config = lib.mkIf config.gruvbox-dark-soft.enable {
  
    stylix = {

      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-soft.yaml";

    };  

  };
}  

{ config, pkgs, lib, ... }:

{ 
  options = {
    mountain.enable = 
      lib.mkEnableOption "enables mountain";
  };
  
  config = lib.mkIf config.mountain.enable {
  
    stylix = {

      base16Scheme = "${pkgs.base16-schemes}/share/themes/mountain.yaml";

    };  

  };
}  

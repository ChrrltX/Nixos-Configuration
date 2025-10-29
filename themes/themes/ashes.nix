{ config, pkgs, lib, ... }:

{ 
  options = {
    ashes.enable = 
      lib.mkEnableOption "enables ashes";
  };
  
  config = lib.mkIf config.ashes.enable {
  
    stylix = {

      base16Scheme = "${pkgs.base16-schemes}/share/themes/ashes.yaml";

    };  

  };
}  

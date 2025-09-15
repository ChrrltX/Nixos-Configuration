{ config, pkgs, lib, ... }:

{ 
  options = {
    catppuccin-mocha.enable = 
      lib.mkEnableOption "enables catppuccin-mocha";
  };
  
  config = lib.mkIf config.catppuccin-mocha.enable {
  
    stylix = {

      #base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    
      base16Scheme = {
        base00 = "11111b"; # crust
        base01 = "181825"; # mantle
        base02 = "313244"; # surface0
        base03 = "45475a"; # surface1
        base04 = "585b70"; # surface2
        base05 = "cdd6f4"; # text
        base06 = "f5e0dc"; # rosewater
        base07 = "b4befe"; # lavender
        base08 = "f38ba8"; # red
        base09 = "fab387"; # peach
        base0A = "f9e2af"; # yellow
        base0B = "a6e3a1"; # green
        base0C = "89dceb"; # sky
        base0D = "89b4fa"; # blue
        base0E = "cba6f7"; # mauve
        base0F = "f5c2e7"; # pink
      };

    };  

  };
}  

{config, pkgs, lib, ...}:

{
  options = {
    papirus.enable = 
      lib.mkEnableOption "enables papirus";
  };
  
  config = lib.mkIf config.papirus.enable {
    
    stylix = {
      icons = {
        enable = true;
        package = pkgs.papirus-icon-theme;
        dark = "Colloid-Dark";
        light = "Colloid-Light";
      };
    };

  }; 
}  

{config, pkgs, lib, ...}:

{
  options = {
    papirus.enable = 
      lib.mkEnableOption "enables papirus";
  };
  
  config = lib.mkIf config.papirus.enable {
    
    stylix = {
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus";
      };
    };

  }; 
}  

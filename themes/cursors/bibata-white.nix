{config, pkgs, lib, ...}:

{
  options = {
    bibata-white.enable = 
      lib.mkEnableOption "enables bibata-white";
  };
  
  config = lib.mkIf config.bibata-white.enable {
    
    stylix.cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 22;
    };

  }; 
}  

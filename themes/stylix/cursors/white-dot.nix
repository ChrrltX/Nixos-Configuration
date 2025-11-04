{config, pkgs, lib, ...}:

{
  options = {
    white-dot.enable = 
      lib.mkEnableOption "enables white-dot";
  };
  
  config = lib.mkIf config.white-dot.enable {
    
    stylix.cursor = {
      package = pkgs.google-cursor;
      name = "GoogleDot-White";
      size = 22;
    };

  };  
}  

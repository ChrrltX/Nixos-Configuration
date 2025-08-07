{ config, pkgs, lib, ... }:

{
  options = {
    screen-tools.enable = 
      lib.mkEnableOption "enables screen-tools";
  };
  
  config = lib.mkIf config.screen-tools.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      
      home.packages = with pkgs; [
        
         # Screenshots:
        grim
        slurp
        swappy
      
      ];

    };

  };  
}

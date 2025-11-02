{ config, pkgs, lib, ... }:

{
  options = {
    vicinae.enable = 
      lib.mkEnableOption "enables vicinae";
  };
  
  config = lib.mkIf config.vicinae.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
        
        services.vicinae = {
        enable = true;
        autoStart = true;
        settings = {
          faviconService = "twenty";
          font.size = 11;
          popToRootOnClose = false;
          rootSearch.searchFiles = false;
          window = {
            csd = true;
            opacity = 0.95;
            rounding = 10;
          };
        };
      };

    };

  };  
}


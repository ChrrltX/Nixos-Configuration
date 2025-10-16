{ config, pkgs, lib, inputs, ... }:

{  
  options = {
    nixcord.enable = 
      lib.mkEnableOption "enables nixcord";
  };
  
  config = lib.mkIf config.nixcord.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {
      
      programs.nixcord = {
        
        enable = true;         
        vesktop.enable = true; 
        dorion.enable = true;

        quickCss = "some CSS";
        
        config = {
          
          useQuickCss = true;
          frameless = true; 
          
          #plugins = { };
        };

        dorion = {
          
          zoom = "1.0";
          blur = "acrylic"; 
          sysTray = false;
          openOnStartup = true;
          autoClearCache = true;
          disableHardwareAccel = false;
          rpcServer = true;
          rpcProcessScanner = true;
          pushToTalk = false;
          desktopNotifications = true;
          unreadBadge = true;

        };

      };

    };
  };  
}

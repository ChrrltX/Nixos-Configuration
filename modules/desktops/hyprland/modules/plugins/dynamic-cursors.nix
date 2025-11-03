{ config, pkgs, lib, inputs, ... }:

{ 
  options = {
    dynamic-cursors.enable = 
      lib.mkEnableOption "enables dynamic-cursors";
  };
  
  config = lib.mkIf config.dynamic-cursors.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {
     
       # Hyprland:
      wayland.windowManager.hyprland = {
        
        plugins = [
          pkgs.hyprlandPlugins.hypr-dynamic-cursors
        ];

        settings = {
          
          "plugin:dynamic-cursors" = {
            shake = {
              enabled = false;
            };  
          };

        };

      };  

    };
  };  
}

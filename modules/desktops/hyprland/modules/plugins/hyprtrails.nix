{ config, pkgs, lib, inputs, ... }:

{ 
  options = {
    hyprtrails.enable = 
      lib.mkEnableOption "enables hyprtrails";
  };
  
  config = lib.mkIf config.hyprtrails.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {
     
       # Hyprland:
      wayland.windowManager.hyprland.plugins = [
        inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprtrails
      ];

    };
  };  
}

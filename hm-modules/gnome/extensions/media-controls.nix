{ config, pkgs, lib, ... }:

{
  options = {
    media-controls.enable = 
      lib.mkEnableOption "enables media-controls";
  };
  
  config = lib.mkIf config.media-controls.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      
      home.packages = [ pkgs.gnomeExtensions.media-controls ];

    };

  };  
}

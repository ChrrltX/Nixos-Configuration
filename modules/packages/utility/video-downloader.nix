{ config, pkgs, lib, ... }:

{
  options = {
    video-downloader.enable = 
      lib.mkEnableOption "enables video-downloader";
  };
  
  config = lib.mkIf config.video-downloader.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ video-downloader ];
    };

  };  
}

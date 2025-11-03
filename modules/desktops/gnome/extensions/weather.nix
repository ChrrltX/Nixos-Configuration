{ config, pkgs, lib, ... }:

{
  options = {
    weather.enable = 
      lib.mkEnableOption "enables weather";
  };
  
  config = lib.mkIf config.weather.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {

      home.packages = [ pkgs.gnomeExtensions.weather-or-not ];

    };

  };  
}

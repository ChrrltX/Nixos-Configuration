{ config, pkgs, lib, ... }:

{
  options = {
    weather-app.enable = 
      lib.mkEnableOption "enables weather-app";
  };
  
  config = lib.mkIf config.weather-app.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ mousam ];
    };

  };  
}

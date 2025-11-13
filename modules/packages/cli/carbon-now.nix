{ config, pkgs, lib, ... }:

{
  options = {
    carbon-now.enable = 
      lib.mkEnableOption "enables carbon-now";
  };
  
  config = lib.mkIf config.carbon-now.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ carbon-now-cli ];
    };

  };  
}

{ config, pkgs, lib, ... }:

{
  options = {
    kde-connect.enable = 
      lib.mkEnableOption "enables kde-connect";
  };
  
  config = lib.mkIf config.kde-connect.enable {
  
    networking.firewall = rec {
      allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
      allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
    };

    home-manager.users.chrrltx = { pkgs, ... }: {
      services.kdeconnect.enable = true;
    };

  };  
}

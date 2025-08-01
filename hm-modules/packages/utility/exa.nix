{ config, pkgs, lib, ... }:

{
  options = {
    exa.enable = 
      lib.mkEnableOption "enables exa";
  };

  config = lib.mkIf config.exa.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ exa ];
    };

  };  
}

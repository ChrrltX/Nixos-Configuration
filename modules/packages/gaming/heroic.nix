{ config, pkgs, lib, ... }:

{
  options = {
    heroic.enable = 
      lib.mkEnableOption "enables heroic";
  };
  
  config = lib.mkIf config.heroic.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ heroic ];
    };

  };  
}

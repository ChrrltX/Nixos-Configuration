{ config, pkgs, lib, ... }:

{
  options = {
    gimp.enable = 
      lib.mkEnableOption "enables gimp";
  };
  
  config = lib.mkIf config.gimp.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ gimp3 ];
    };

  };  
}

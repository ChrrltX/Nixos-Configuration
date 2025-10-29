{ config, pkgs, lib, ... }:

{
  options = {
    scrcpy.enable = 
      lib.mkEnableOption "enables scrcpy";
  };
  
  config = lib.mkIf config.scrcpy.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ scrcpy ];
    };

  };  
}

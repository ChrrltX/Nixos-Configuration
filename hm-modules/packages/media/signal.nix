{ config, pkgs, lib, ... }:

{
  options = {
    signal.enable = 
      lib.mkEnableOption "enables signal";
  };
  
  config = lib.mkIf config.signal.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      programs.signal-desktop.enable = true;
    };

  };  
}

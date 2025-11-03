{ config, pkgs, lib, ... }:

{
  options = {
    lock-keys.enable = 
      lib.mkEnableOption "enables lock-keys";
  };
  
  config = lib.mkIf config.lock-keys.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      
      home.packages = [ pkgs.gnomeExtensions.lock-keys ];

    };

  };  
}

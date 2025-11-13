{ config, pkgs, lib, ... }:

{
  options = {
    woomer.enable = 
      lib.mkEnableOption "enables woomer";
  };
  
  config = lib.mkIf config.woomer.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ woomer ];
    };

  };  
}

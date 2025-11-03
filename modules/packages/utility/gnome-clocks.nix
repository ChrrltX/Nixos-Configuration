{ config, pkgs, lib, ... }:

{
  options = {
    gnome-clocks.enable = 
      lib.mkEnableOption "enables gnome-clocks";
  };
  
  config = lib.mkIf config.gnome-clocks.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ gnome-clocks ];
    };

  };  
}

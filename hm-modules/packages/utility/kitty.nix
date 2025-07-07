{ config, pkgs, lib, ... }:

{
  options = {
    kitty.enable = 
      lib.mkEnableOption "enables kitty";
  };
  
  config = lib.mkIf config.kitty.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ kitty ];
      programs.kitty = {
        enable = true;
        settings = {
          confirm_os_window_close = "0";
        };
      };
    };

  };  
}

{ config, pkgs, lib, ... }:

{
  options = {
    nh.enable = 
      lib.mkEnableOption "enables nh";
  };

  config = lib.mkIf config.nh.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ 

        nh 
        nvd
        nix-output-monitor

      ];
    };

  };  
}

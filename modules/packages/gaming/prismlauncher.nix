{ config, pkgs, lib, ... }:

{
  options = {
    prismlauncher.enable = 
      lib.mkEnableOption "enables prismlauncher";
  };

  config = lib.mkIf config.prismlauncher.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ prismlauncher ];
    };

  };  
}

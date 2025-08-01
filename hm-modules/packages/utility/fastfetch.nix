{ config, pkgs, lib, ... }:

{
  options = {
    fastfetch.enable = 
      lib.mkEnableOption "enables fastfetch";
  };

  config = lib.mkIf config.fastfetch.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ fastfetch ];

      programs.zsh = {
        initContent = "fastfetch";
      };

    };  

  };  
}

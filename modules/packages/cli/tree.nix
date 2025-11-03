{ config, pkgs, lib, ... }:

{
  options = {
    tree.enable = 
      lib.mkEnableOption "enables tree";
  };
  
  config = lib.mkIf config.tree.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ tree ];
    };

  };  
}


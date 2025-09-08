{ config, pkgs, lib, inputs, ... }:

{
  options = {
    zen-browser.enable = 
      lib.mkEnableOption "enables zen-browser";
  };
  
  config = lib.mkIf config.zen-browser.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      
      imports = [ inputs.zen-browser.homeModules.twilight ];
      
      programs.zen-browser = {
        enable = true;
      };

    };

  };  
}

{ config, pkgs, lib, ... }:

{
  home-manager.users.chrrltx = { pkgs, ... }: {
      
    home.packages = with pkgs; [
        
       # Screenshots:
      grim
      slurp
      swappy

       # Screen Recording:
      wf-recorder 
      vlc
      
    ];

  };  
}

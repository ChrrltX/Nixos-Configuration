{ config, pkgs, lib, ... }:

{
  options = {
    steam.enable = 
      lib.mkEnableOption "enables steam";
  };

  config = lib.mkIf config.steam.enable {
     
     # Proton:
    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ protonplus ];
    };

     # Steam:
    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;
   
     # Gamemode:
    programs.gamemode.enable = true;

     # Steam Compatibility Tools:
    environment.sessionVariables = {  
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/user/.steam/root/compatibiltytools.d";
    };
   
  }; 
}

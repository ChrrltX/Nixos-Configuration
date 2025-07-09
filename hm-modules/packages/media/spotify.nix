{ config, pkgs, lib, inputs, ... }:

{ 
  #options = {
  #  spotify.enable = 
  #    lib.mkEnableOption "enables spotify";
  #};

  #imports = [ inputs.spicetify-nix.nixosModules.default ];

  #config = lib.mkIf config.spotify.enable {
    
    programs.spicetify =
    #let
    #  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    #in
    {
      enable = true;

      #enabledExtensions = with spicePkgs.extensions; [
      #  adblock
      #  hidePodcasts
      #  shuffle
      #];

    };  

    environment.systemPackages = with pkgs; [ spotify ];

    #home-manager.users.chrrltx = { pkgs, ... }: {
    #  home.packages = with pkgs; [ "spotify" "spicetify-cli" ];
    #};

  #};  
}

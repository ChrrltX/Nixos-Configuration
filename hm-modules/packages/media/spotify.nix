{ config, pkgs, lib, inputs, ... }:

{ 
  options = {
    spotify.enable = 
      lib.mkEnableOption "enables spotify";
  };

  config = lib.mkIf config.spotify.enable {

    programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      
      enable = true;

      enabledExtensions = with spicePkgs.extensions; [
        
        adblock
        hidePodcasts
        shuffle
        fullAppDisplay
        fullAlbumDate

      ];

      enabledCustomApps = with spicePkgs.apps; [
        
        newReleases
        marketplace

      ];

      enabledSnippets = with spicePkgs.snippets; [
        
        pointer
        oneko
        roundedImages
        "smoothProgress/VolumeBar"
        hideAudiobooksButton
        hidePodcastButton
        spinningCdCoverArt
      
      ];  

    };
  };  
}

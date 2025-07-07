{ config, pkgs, lib, ... }:

{
  options = {
    vesktop.enable = 
      lib.mkEnableOption "enables vesktop";
  };

  config = lib.mkIf config.vesktop.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {
      
      programs.vesktop = {
        
	enable = true;

	settings = {

	  autoUpdate = true;
          autoUpdateNotification = false;
	  useQuickCss = true;
	  frameless = true;
	  hardwareAcceleration = true;
	  videoHardwareAcceleration = true;
	  discordBranch = "stable";
	  minimizeToTray = false;  
	
	  plugins = {
	    
	    enable = true;
	  
	    MessageLogger.enabled = true;
	    FakeNitro.enabled = true;
	    BetterFolders.enabled = true;
	    AlwaysAnimate.enabled = true;
	    CallTimer.enabled = true;
	    ClearURLs.enabled = true;
	    DisableCallIdle.enabled = true;
	    FixSpotifyEmbeds.enabled = true;
	    SpotifyControls.enabled = true;
	    SpotifyCrack.enabled = true;
	    ImageZoom.enabled = true;
	    NoTrack.enabled = true;
	    PinDMs.enabled = true;
	    PlatformIndicators.enabled = true;
	    ReadAllNotificationsButton.enabled = true;
	    SilentTyping.enabled = true;
            Translate.enabled = true;
	    VolumeBooster.enabled = true;
	    YoutubeAdblock.enabled = true;

	  };
        };  

      };

    };
  };  
}

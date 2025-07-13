{ config, pkgs, lib, ... }:

{
  stylix = {

    autoEnable = true;
      
     # Theme:
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
       
     # Wallpaper:
    image = ./wallpapers/purple-desert.png;
       
     # Dark/Light Theme:
    polarity = "dark";
 
     # Window Opacity:
    opacity = {
        
      applications = 0.9;
      terminal = 0.8;
      popups = 0.9;

    };	
       
     # Cursor:
    cursor = {
       
      #package = pkgs.bibata-cursors;
      package = pkgs.google-cursor;
      #package = pkgs.oreo-cursors-plus;

      #name = "Bibata-Modern-Ice";
      name = "GoogleDot-White";
      #name = "Oreo-Spark-White";
      
      size = 22;
    
    };

     # Fonts:
    fonts = {

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      emoji = {
        package = pkgs.noto-fonts-monochrome-emoji;
	name = "Noto Fonts Monochrome Emoji";
      };

       # Font Sizes:
      sizes = {
	  
        terminal = 20;
	
      };

    };
     
     # Enable for HM:
    homeManagerIntegration = {
      
      followSystem = true;
      autoImport = true;

    };  

  };

  home-manager.users.chrrltx = { pkgs, ... }: {
    
      gtk.enable = true;

  };

}

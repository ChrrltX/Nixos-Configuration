{ config, pkgs, lib, ... }:

{ 
  imports = [
      
     # Themes: 
    ./themes/catppuccin-mocha.nix
    ./themes/gruvbox-dark-soft.nix
    ./themes/mountain.nix
    ./themes/ashes.nix

     
     # Cursors:
    ./cursors/bibata-white.nix
    ./cursors/white-dot.nix
  
  ];

  stylix = {

    autoEnable = true;

     # Wallpaper:
    #image = ./wallpapers/dark-cat.png;
       
     # Dark/Light Theme:
    polarity = "dark";
 
     # Window Opacity:
    opacity = {
        
      applications = 1;
      terminal = 0.95;
      popups = 0.85;

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

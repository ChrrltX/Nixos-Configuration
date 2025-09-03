{ config, pkgs, lib, ... }:

{
  stylix = {

    autoEnable = true;
      
     # Theme:

     # Catppuccin Mocha:
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    #base16Scheme = {
    #  base00 = "1e1e2e"; # base
    #  base01 = "181825"; # mantle
    #  base02 = "313244"; # surface0
    #  base03 = "45475a"; # surface1
    #  base04 = "585b70"; # surface2
    #  base05 = "cdd6f4"; # text
    #  base06 = "f5e0dc"; # rosewater
    #  base07 = "b4befe"; # lavender
    #  base08 = "f38ba8"; # red
    #  base09 = "fab387"; # peach
    #  base0A = "f9e2af"; # yellow
    #  base0B = "a6e3a1"; # green
    #  base0C = "94e2d5"; # teal
    #  base0D = "89b4fa"; # blue
    #  base0E = "cba6f7"; # mauve
    #  base0F = "f2cdcd"; # flamingo
    #};
     
     # Gruvbox:
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
       
     # Wallpaper:
    #image = ./wallpapers/dark-cat.png;
       
     # Dark/Light Theme:
    polarity = "dark";
 
     # Window Opacity:
    opacity = {
        
      applications = 1;
      terminal = 0.8;
      popups = 0.85;

    };	
       
     # Cursor:
    cursor = {
       
      package = pkgs.bibata-cursors;
      #package = pkgs.google-cursor;
      #package = pkgs.oreo-cursors-plus;

      name = "Bibata-Modern-Ice";
      #name = "GoogleDot-White";
      #name = "Oreo-Spark-Lite";
      
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

{
   #\\\\\\\\\\\\\\\\
   #----------------
   # My Main Flake:
   #----------------
   #////////////////

  description = "I Lov Mari";

  inputs = {
     
     #>>> Nix, HM:
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

     #>>> Disko:
#    inputs.disko = {
#      url = "github:nix-community/disko/latest";
#      inputs.nixpkgs.follows = "nixpkgs";
#    };  
    
     #>>> Hyprland:
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/Hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
     
     #>>> Vicinae:
    vicinae = {
      url = "github:vicinaehq/vicinae";
    };  
     
     #>>> Stylix:
    stylix = {
      url = "github:danth/stylix"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };  

     #>>> NVF:
    nvf = {
      url = "github:notashelf/nvf"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };  
     
     #>>> Spicetify:
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
     
     #>>> Zen Browser
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";    
    };  
     
     #>>> Flatpak:
    nix-flatpak = {
      url = "github:gmodena/nix-flatpak";
      #inputs.nixpkgs.follows = "nixpkgs";
    };  

  };
   
   #\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
   # Write Name of Every Input Here:
   #/////////////////////////////////

  outputs = inputs@{ 
    
    nixpkgs, 
    home-manager,
#    disko,
    hyprland,
    hyprland-plugins,
    vicinae,
    stylix,
    nvf,
    spicetify-nix,
    zen-browser,
    nix-flatpak,
    ...
    
  }: {
     
     #\\\\\\\\\\\\\\\\\\\\\
     #---------------------
     # Host Configuration:
     #---------------------
     #/////////////////////

    nixosConfigurations = {
      
      #>>> !TODO!, Set Your Hostname:
     NixPC = nixpkgs.lib.nixosSystem {
       system = "x86_64-linux";
       specialArgs = { inherit inputs; };
       modules = [

         {  #>>> !TODO!, Set Your Hostname:
           networking.hostName = "NixPC";
         }  
         
          #\\\\\\\\\\
          # Imports: 
          #//////////

         ./hosts/chrrltx-pc/configuration.nix
         ./modules/default.nix
         ./themes/default.nix
          
          #\\\\\\\\\\\\\\\\
          # NixOS Modules:
          #////////////////

	 #disko.nixosModules.disko
	 stylix.nixosModules.stylix
         spicetify-nix.nixosModules.default
	 nvf.nixosModules.default
         nix-flatpak.nixosModules.nix-flatpak
          
          #\\\\\\\\\\\\\
          # HM Modules:
          #/////////////

         home-manager.nixosModules.home-manager
         {
           home-manager.useGlobalPkgs = true;
           home-manager.useUserPackages = true;
           home-manager.sharedModules = [
             inputs.vicinae.homeManagerModules.default
           ];
         }

       ];
     }; 
      
      #>>> !TODO!, Set Your Hostname:
     NixLP = nixpkgs.lib.nixosSystem {
       system = "x86_64-linux";
       specialArgs = { inherit inputs; };
       modules = [

         {  #>>> !TODO!, Set Your Hostname:
           networking.hostName = "NixLP";
         }
          
          #\\\\\\\\\\
          # Imports:
          #//////////

         ./hosts/chrrltx-lp/configuration.nix
         ./modules/default.nix
         ./themes/default.nix
          
          #\\\\\\\\\\\\\\\\
          # NixOS Modules:
          #////////////////

	 stylix.nixosModules.stylix
         spicetify-nix.nixosModules.default
	 nvf.nixosModules.default
         vicinae.nixosModules.default
          
          #\\\\\\\\\\\\\
          # HM Modules:
          #/////////////

         home-manager.nixosModules.home-manager
         { 
           home-manager.useGlobalPkgs = true;
           home-manager.useUserPackages = true;
           home-manager.sharedModules = [ 
             inputs.vicinae.homeManagerModules.default
           ];
         }

       ];  
     };
     
    };
  };
}

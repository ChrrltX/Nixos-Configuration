{
  description = "I Lov Mari";

  inputs = {
     
     # Nix, HM:
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

     # Disko:
#    inputs.disko = {
#      url = "github:nix-community/disko/latest";
#      inputs.nixpkgs.follows = "nixpkgs";
#    };  
    
     # Hyprland:
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/Hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
     
     # Vicinae:
    vicinae = {
      url = "github:vicinaehq/vicinae";
    };  
     
     # Stylix:
    stylix = {
      url = "github:danth/stylix"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };  

     # NVF:
    nvf = {
      url = "github:notashelf/nvf"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };  
     
     # Spicetify:
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
     
     # Zen Browser
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";    
    };  
     
     # Nixcord:
    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
     
     # Flatpak:
    nix-flatpak = {
      url = "github:gmodena/nix-flatpak";
      inputs.nixpkgs.follows = "nixpkgs";
    };    

  };

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
    nixcord,
    nix-flatpak,
    ...
    
  }: {

    nixosConfigurations = {
   
     NixPC = nixpkgs.lib.nixosSystem {
       system = "x86_64-linux";
       specialArgs = { inherit inputs; };
       modules = [

         ./hosts/chrrltx-pc/configuration.nix
         ./nixos-modules
         ./hm-modules
         ./themes/default.nix
         
#	 disko.nixosModules.disko
	 stylix.nixosModules.stylix
         spicetify-nix.nixosModules.default
	 nvf.nixosModules.default
         nix-flatpak.nixosModules.nix-flatpak
         #inputs.nixcord.nixosModules.nixcord

         {
           networking.hostName = "NixPC";
         }  
 
         home-manager.nixosModules.home-manager
         {
           #home-manager.extraSpecialArgs = { inherit inputs; };
           home-manager.useGlobalPkgs = true;
           home-manager.useUserPackages = true;
           #home-manager.users.chrrltx = ./hosts/chrrltx-pc/home.nix;
           home-manager.sharedModules = [
             inputs.nixcord.homeModules.nixcord
             inputs.vicinae.homeManagerModules.default
           ];
         }

       ];
     }; 
   
     NixLP = nixpkgs.lib.nixosSystem {
       system = "x86_64-linux";
       specialArgs = { inherit inputs; };
       modules = [

         ./hosts/chrrltx-lp/configuration.nix
         ./nixos-modules
         ./hm-modules
         ./themes/default.nix

	 stylix.nixosModules.stylix
         spicetify-nix.nixosModules.default
	 nvf.nixosModules.default
         vicinae.nixosModules.default

         {
           networking.hostName = "NixLP";
         }

         home-manager.nixosModules.home-manager
         { 
           #home-manager.extraSpecialArgs = { inherit inputs; };
           home-manager.useGlobalPkgs = true;
           home-manager.useUserPackages = true;
           #home-manager.users.chrrltx = ./hosts/chrrltx-pc/home.nix;
           home-manager.sharedModules = [
             inputs.nixcord.homeModules.nixcord
           ];
         }

       ];  
     };
     
    };
  };
}

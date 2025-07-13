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
    
     # Stylix:
    stylix = {
      url = "github:danth/stylix"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };  
     
     # AGS:
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.astal.follows = "astal";
    };    

     # Spicetify:
   spicetify-nix.url = "github:Gerg-L/spicetify-nix";

  };

  outputs = inputs@{ 
    
    nixpkgs, 
    home-manager,
#    disko,
    hyprland,
    hyprland-plugins,
    stylix,
    ags,
    astal,
    spicetify-nix,
    ...
    
  }: {

    nixosConfigurations = {
   
     NixPC = nixpkgs.lib.nixosSystem {
       system = "x86_64-linux";
       modules = [

         ./hosts/chrrltx-pc/configuration.nix
         ./nixos-modules
         ./hm-modules
         ./themes/default.nix
         
#	 disko.nixosModules.disko
	 stylix.nixosModules.stylix
         spicetify-nix.nixosModules.default
#	 ags.nixosModules.default

         {
           networking.hostName = "NixPC";
         }  
 
         home-manager.nixosModules.home-manager
         {
           home-manager.useGlobalPkgs = true;
           home-manager.useUserPackages = true;
           #home-manager.users.chrrltx = ./hosts/chrrltx-pc/home.nix;
         }
 
       ];
     }; 
   
#   NixLP = nixpkgs.lib.nixosSystem {
  
    };
  };
}

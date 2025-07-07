{
  description = "I Lov Mari";

  inputs = {
     
     # Nix, HM:
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
     # Hyprland:
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/Hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    
     # Stylix
    stylix = {
      url = "github:danth/stylix"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };  

  };

  outputs = inputs@{ 
    
    nixpkgs, 
    home-manager, 
    hyprland,
    hyprland-plugins,
    stylix,
    ...
    
  }: {

    nixosConfigurations = {
   
     NixPC = nixpkgs.lib.nixosSystem {
       system = "x86_64-linux";
       modules = [

         ./hosts/chrrltx-pc/configuration.nix
         ./nixos-modules
         ./hm-modules

	 stylix.nixosModules.stylix
	 ./themes/default.nix

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

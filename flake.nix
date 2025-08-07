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
     
     # Caelestia Shell:
    caelestia-shell = {
      url = "github:your-repo/caelestia-shell-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };    
    
     # Stylix:
    stylix = {
      url = "github:danth/stylix"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };  

     # NVF:
    nvf.url = "github:notashelf/nvf"; 
     
     # Spicetify:
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

  };

  outputs = inputs@{ 
    
    nixpkgs, 
    home-manager,
#    disko,
    hyprland,
    hyprland-plugins,
    caelestia-shell,
    stylix,
    nvf,
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
	 nvf.nixosModules.default

         {
           networking.hostName = "NixPC";
         }  
 
         home-manager.nixosModules.home-manager
         {
           home-manager.useGlobalPkgs = true;
           home-manager.useUserPackages = true;
           #home-manager.users.chrrltx = ./hosts/chrrltx-pc/home.nix;
         }

         caelestia-shell.nixosModules.default
         {
           services.caelestia-shell.enable = true;
           # Optional: customize configuration
           services.caelestia-shell.config = {
             bar.workspaces.shown = 5;
             dashboard.weatherLocation = "40.7128,-74.0060"; # NYC coordinates
           };
         }
 
       ];
     }; 
   
#   NixLP = nixpkgs.lib.nixosSystem {
  
    };
  };
}

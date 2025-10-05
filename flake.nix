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
    #caelestia-shell = {
    #  url = "github:kochkaev/caelestia-shell-nixos";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};  

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
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
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
     
     # Zen Browser
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";    
    };  

  };

  outputs = inputs@{ 
    
    nixpkgs, 
    home-manager,
#    disko,
    hyprland,
    hyprland-plugins,
    #caelestia-shell,
    quickshell,
    stylix,
    nvf,
    spicetify-nix,
    zen-browser,
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
         #caelestia-shell.nixosModules.default

         {
           networking.hostName = "NixPC";
           environment.systemPackages = [
             quickshell.packages.x86_64-linux.default
           ];
         }  
 
         home-manager.nixosModules.home-manager
         {
           home-manager.useGlobalPkgs = true;
           home-manager.useUserPackages = true;
           #home-manager.users.chrrltx = ./hosts/chrrltx-pc/home.nix;
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
         #caelestia-shell.nixosModules.default

         {
           networking.hostName = "NixLP";
           environment.systemPackages = [
             quickshell.packages.x86_64-linux.default
           ];
         }

         home-manager.nixosModules.home-manager
         {
           home-manager.useGlobalPkgs = true;
           home-manager.useUserPackages = true;
           #home-manager.users.chrrltx = ./hosts/chrrltx-pc/home.nix;
         }

       ];  
     };
     
    };
  };
}

{ config, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ./home.nix
  ];

   # Bootloader:
  boot.loader.grub = {
    enable = true;
    useOSProber = true;
    efiSupport = true;
    device = "nodev";
  };  
  boot.loader.efi.canTouchEfiVariables = true;

   # Networking:
  networking.networkmanager.enable = true;

   # Locales:
  time.timeZone = "Europe/Prague";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

   # User:
  users.users.chrrltx = {
    isNormalUser = true;
    description = "ChrrltX";
    extraGroups = [ "networkmanager" "wheel" ];
  };

   # Unfree Packages:
  nixpkgs.config.allowUnfree = true;

   # Define Default Flake Path (For nh):
  environment.sessionVariables = {
    NH_FLAKE = "/etc/nixos/flake.nix";
  }; 

   # Flakes:
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 

   # NixOS Version:
  system.stateVersion = "25.05";

}

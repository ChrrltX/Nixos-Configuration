{ config, pkgs, lib, ... }:

{
  options = {
    proton-vpn.enable = 
      lib.mkEnableOption "enables proton-vpn";
  };
  
  config = lib.mkIf config.proton-vpn.enable {
  
    networking.firewall.checkReversePath = false;
    
    environment.systemPackages = with pkgs; [
      
      wireguard-tools 
      protonvpn-gui

    ];

  };  
}

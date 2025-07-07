{ config, pkgs, lib, ... }:

{
  options = {
    amd.enable = 
      lib.mkEnableOption "enables amd";
  };
  
  config = lib.mkIf config.amd.enable {

     # Enable AMD:
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    services.xserver.videoDrivers = ["amdgpu"];
    
     # GUI Tool:
    environment.systemPackages = with pkgs; [ lact ];
    systemd.packages = with pkgs; [ lact ];
    systemd.services.lactd.wantedBy = ["multi-user.target"];

  };  
}

{ config, pkgs, lib, inputs, ... }:

{
  home-manager.users.chrrltx = { pkgs, ... }: {
    home.packages = with pkgs; [ power-profiles-daemon ];
  };
}

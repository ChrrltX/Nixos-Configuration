## My NixOS Configurations

> *Anyone is free to take my configuration and edit it to their liking, i hope that i could help inspire some people at least or help them get ideas for structuring their own NixOS configuration*

**What i'm trying for my configuration to be:**
- Accessible to everyone, from beginners to advanced users
- Easily readable and usable to almost everyone => really simple
- Really modular, so i could use my configuration on multiple devices and choose exactly which options i want on each device
- Easily configurable, from enabled packages to themes
- As declarative as possible, i really wanna have everything in NixOS, including the configurations of all apps i use, desktops, all of my themes and anything else

**How my config works:**
- The "hosts" directory is where all my hosts are, in them i have `hardware-configuration.nix` (which i place there manually based on the device i'm on), `configuration.nix` (which i use for my system config, like my locals, etc..), and lastly `home.nix` (which i use for all the user config, and that consists of my installed packages or themes)
- I make "enable" options for almost every part of my config to make it more modular, so you can go to your `home.nix` and for examble install the Brave browser: `brave.enable = true;`, and you can choose different options on each host without having to import nor remember directories of the specific modules, and you can move them freely without breaking anything
- The "nixos-modules" directory is used for the more system stuff, like my bootloader config, drivers, ...
- The "hm-modules" directory is used for the more user stuff, like my apps, my DEs/WMs, ...
- The "themes" directory is for all my installed themes, cursors, ...
- And lastly, all of my configuration runs thru `flake.nix`

**What do i wanna change or add:**
- I want to add an option to run my home server as well, and fully convert it into running NixOS
- I wanna add Impermanence (to wipe my disk on every reboot and rebuild my system from my configuration, to keep my disk clean)


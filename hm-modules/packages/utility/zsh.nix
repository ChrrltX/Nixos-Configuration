{ config, pkgs, lib, ... }:

{
  options = {
    zsh.enable = 
      lib.mkEnableOption "enables zsh";
  };
  
  config = lib.mkIf config.zsh.enable {
    
    programs.zsh.enable = true;
    users.users.chrrltx.shell = pkgs.zsh;

    home-manager.users.chrrltx = { pkgs, ... }: {
      
      home.packages = with pkgs; [ zsh-powerlevel10k ];
      
      programs.zsh = {

        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
          add-nixos = "cd ~/nixos & git add .";
          commit = "git commit -m";
          push-nixos = "cd ~/nixos & git push Nixos-Configuration main";
          switch = "nh os switch ~/nixos";
          clean = "nh clean all --keep 3";
          clean-dry = "nh clean all --keep 3 --dry";
        };
      
        plugins = [

           # Powerlevel10k Theme:
          {                                                                                   
            name = "powerlevel10k";                                                           
            src = pkgs.zsh-powerlevel10k;                                                     
            file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";                         
          }

        ];

        initExtra = ''
          source ~/.p10k.zsh
        '';

        oh-my-zsh = {
          enable = true;
          plugins = [
            "git"
            "colored-man-pages"
          ];
        };

        history.size = 10000;
        history.ignoreAllDups = true;
        history.path = "$HOME/.zsh_history";
        history.ignorePatterns = ["rm *" "pkill *" "cp *"];
      
      };

    };

  };  
}

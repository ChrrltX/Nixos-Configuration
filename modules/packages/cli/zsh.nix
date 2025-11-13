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
      
      home.packages = with pkgs; [ zsh-powerlevel10k fortune ];

      programs.oh-my-posh = {
        enable = true;
        #useTheme = "catppuccin_mocha";
        #useTheme = "catppuccin"; 
        useTheme = "clean-detailed";
        enableZshIntegration = true;
      };
      
      programs.zsh = {

        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
           
           # Git:
          add-nixos = "cd ~/nixos | git add .";
          commit-nixos = "cd ~/nixos | git commit -m";
          push-nixos = "cd ~/nixos | git push Nixos-Configuration main";
          pull-nixos = "cd ~/nixos | git pull Nixos-Configuration main";
           
           # Nixos:
          switch = "nh os switch ~/nixos";
          update = "nh os switch ~/nixos --update";
          clean = "nh clean all --keep 3";
          clean-dry = "nh clean all --keep 3 --dry";

          rebuild = "cd ~/nixos | sudo nixos-rebuild switch --flake .";

           # Vim:
          v = "cd ~/nixos | vim";

           # Other:
          scr = ''grim -g "$(slurp -w 0)" - | swappy -f -'';
          boblox = "nohup flatpak run org.vinegarhq.Vinegar & disown";
          cat = "bat";
          ls = "eza";
          trash = "rm -rf .local/share/Trash";

        };
      
        #plugins = [

           # Powerlevel10k Theme:
          #{                                                                                   
          #  name = "powerlevel10k";                                                           
          #  src = pkgs.zsh-powerlevel10k;                                                     
          #  file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";                         
          #}

        #];

        #initContent = ''
        #  source ~/.p10k.zsh
        #'';

        initContent = ''
          cd ~/nixos
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

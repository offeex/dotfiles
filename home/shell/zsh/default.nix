{ config, ... }: 

{
    programs.zsh = {
        enable = true;
        oh-my-zsh = {
            enable = true;
            theme = "refined";
            plugins = [
                "git"
            ];
        };
        
        autosuggestion.enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
    };

    home.file.".zshrc".text = (builtins.readFile ./.zshrc);
}

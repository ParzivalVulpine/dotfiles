if status is-interactive
    fzf --fish | source
    starship init fish | source
    thefuck --alias | source
end

function fish_greeting
    fortune -se linuxcookie computers | cowsay -f tux | lolcat -t
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/parzv/miniconda3/bin/conda
    eval /Users/parzv/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/Users/parzv/miniconda3/etc/fish/conf.d/conda.fish"
        . "/Users/parzv/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/Users/parzv/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<


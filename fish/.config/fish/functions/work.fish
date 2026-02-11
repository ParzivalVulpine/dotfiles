function work
    set venv_path (find . -maxdepth 3 -type f -path "*/bin/activate.fish" -print -quit)
    if test -z "$venv_path"
        echo (set_color red)">No virtualenv found in this project"(set_color normal)
        return 1
    end

    venv
    tmux-work
end

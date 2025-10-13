function venv
    set venv_path (find . -maxdepth 3 -type f -path "*/bin/activate.fish" -print -quit)
    if test -n "$venv_path"
        set project (basename (pwd))
        echo (set_color green)">Activating virtualenv for "(set_color cyan)$project(set_color normal).
        source $venv_path
    else
        echo (set_color red)">No virtualenv found in this project"(set_color normal)
    end
end

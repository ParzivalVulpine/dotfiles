function venv
    set venv_path (find . -maxdepth 3 -type f -path "*/bin/activate.fish" -print -quit)
    if test -n "$venv_path"
        set dir (dirname (dirname $venv_path))
        echo (set_color green)">Activating virtualenv at "(set_color cyan)$dir(set_color normal)
        source $venv_path
    else
        echo (set_color red)">No virtualenv found in this project"(set_color normal)
    end
end

function launch
    if test (count $argv) -eq 1
        set selected $argv[1]
    else
        set selected (find ~/Projects ~/Projects/datil ~/Documents/obsidian -mindepth 1 -maxdepth 1 -type d | fzf)
    end

    if test -z "$selected"
        return 0
    end

    cd "$selected"
    nvim .
end

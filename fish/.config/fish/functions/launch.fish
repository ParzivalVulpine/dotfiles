function launch
    if test (count $argv) -eq 1
        set selected $argv[1]
    else
        set selected (find ~/Projects -mindepth 1 -maxdepth 1 -type d | fzf)
    end

    if test -z "$selected"
        return 0
    end

    # Convert the selected directory name to replace '.' with '_'
    set selected_name (basename $selected | string replace . _)

    # Check if tmux is running
    set tmux_running (pgrep tmux)

    # If we're not in a tmux session and no tmux process is running, create a new tmux session
    if test -z "$TMUX" -a -z "$tmux_running"
        tmux new-session -s $selected_name -c $selected
        exit 0
    end

    # If the session doesn't exist, create it
    if not tmux has-session -t=$selected_name ^/dev/null
        tmux new-session -ds $selected_name -c $selected
    end

    # Switch to the tmux session
    tmux switch-client -t $selected_name
end

function tmux-work
    set session (basename (pwd))
    # Create the session detached, with the first window
    tmux new-session -d -s $session

    # Create 4 more windows
    for i in (seq 2 5)
        tmux new-window -t $session
    end

    # Attach to the session
    tmux attach-session -t $session
end

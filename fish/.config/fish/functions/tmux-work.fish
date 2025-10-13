function tmux-work
    set session (basename (pwd))
    tmux new-session -s $session
end

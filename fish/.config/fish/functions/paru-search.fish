function paru-search
    set fzf_args \
        --multi \
        --preview 'paru -Sii {1}' \
        --bind 'alt-p:toggle-preview' \
        --bind 'alt-d:preview-half-page-down,alt-u:preview-half-page-up' \
        --bind 'alt-k:preview-up,alt-j:preview-down' \
        --bind 'alt-b:change-preview:paru -Gpa {1} | tail -n +5' \
        --bind 'alt-B:change-preview:paru -Siia {1}' \
        --color 'pointer:green,marker:green'

    # Get list of all packages (official repos + AUR)
    # paru -Slqa lists all available package names
    set pkg_names (paru -Slq | fzf $fzf_args)

    if test -n "$pkg_names"
        # Convert newline-separated to space-separated
        set pkg_list (string split \n -- $pkg_names)
        paru -S --noconfirm $pkg_list
    end
end

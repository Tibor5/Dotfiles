function fish_greeting
end

if status --is-login
    if test (tty) = /dev/tty1
        exec Hyprland
    end
end

if status is-interactive
    function fish_user_key_bindings
        fish_vi_key_bindings
    end

    # ~  Source
    # pyenv init - | source

    # ~  Prompt
    starship init fish | source
end

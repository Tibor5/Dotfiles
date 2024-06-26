set -U fish_greeting

if status --is-login
    if test (tty) = /dev/tty1
        exec Hyprland
    end
end

if status is-interactive
    function fish_user_key_bindings
        fish_vi_key_bindings
    end
    # fish_config theme save "Catppuccin Macchiato"
    pyenv init - | source
    pyenv virtualenv-init - | source
    starship init fish | source
end

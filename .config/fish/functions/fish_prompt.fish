function fish_prompt
    # Get vi-mode state (normal, insert, replace, visual)
    set mode $fish_bind_mode

    # Pick colour for @ based on mode
    switch $mode
        case default normal
            set at_color red # normal mode
        case insert
            set at_color green # insert mode
        case replace_one replace
            set at_color magenta # replace mode
        case visual
            set at_color blue # visual mode
        case '*'
            set at_color brblack # fallback
    end

    # Username
    set_color $at_color
    echo -n (whoami)

    # @ with mode colour
    set_color white
    echo -n "@"

    # Hostname
    set_color white
    echo -n (hostname -s)

    # Reset and show cwd + >
    set_color normal
    echo -n " "(prompt_pwd)" > "
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Created by `pipx` on 2025-09-24 20:45:25
set PATH $PATH /home/seth/.local/bin


alias bat="batcat"

thefuck --alias | source

alias fd="fdfind"

zoxide init fish | source

fish_vi_key_bindings
functions -e fish_mode_prompt

starship init fish | source

alias rg="rgrep"

export PATH="$HOME/.config/emacs/bin:$PATH"

function pomo
    set min $argv[1]
    set args $argv[2..-1]

    if test -z "$min" -o -z "$args"
        echo "Usage: pomo <minutes> <message>"
        return 1
    end

    set sec (math "$min * 60")
    set msg "$args"

    while true
        date '+%H:%M'
        sleep $sec
        notify-send -u critical -t 0 -a pomo "$msg"
    end
end

alias lofi="ytplay -u \"https://www.youtube.com/watch?v=jfKfPfyJRdk\""

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

alias word="wordgrinder"

if status is-interactive
    alias ls='eza --icons --group-directories-first'
    alias la='eza -la --icons --group-directories-first'
    alias ll='eza -l --icons --group-directories-first'
    alias lt='eza -T --icons --group-directories-first'
end

function fish_greeting
    fastfetch
end

function retry-spotdl
    set max_retries 5
    set retry_delay 5
    set count 0

    while true
        spotdl $argv
        if test $status -eq 0
            return 0
        end

        set count (math $count + 1)
        echo "Attempt $count failed."

        if test $count -ge $max_retries
            echo "Failed after $max_retries attempts."
            return 1
        end

        echo "Retrying in $retry_delay seconds..."
        sleep $retry_delay
    end
end

alias lazy="lazygit"

fish_add_path ~/.config/emacs/bin/
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' # got this idea from https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles/

alias dg='ddgr'

# Source system profile
if not type -q bass
    set bass_path $HOME/.config/fish/bass
    git clone --depth 1 https://github.com/edc/bass.git $bass_path
    pushd $bass_path && make install && popd
end
# bass source /etc/profile

# Aliases
alias img="mpv --keep-open=always" # stops before playing next
alias imga="mpv --keep-open" # autoplays next
alias imgs="mpv --keep-open=always --vo=sixel --really-quiet"
alias imgsa="mpv --keep-open --vo=sixel --really-quiet "

# Path
set -gx PATH $PATH $HOME/.local/bin
set -gx PATH $PATH $HOME/.cargo/bin
set -gx PATH $PATH $HOME/.local/share/flatpak/exports/bin

# Kvantum
set -gx QT_STYLE_OVERRIDE kvantum

# Java
set -gx _JAVA_AWT_WM_NONREPARENTING 1

# Config home
set -gx XDG_CONFIG_HOME $HOME/.config

# EDITOR
set -gx EDITOR hx

if status is-interactive
    # GPG tui
    set -gx GPG_TTY (tty)
end

if status is-login
    if test /dev/tty1 = (tty)
        # fcitx input method
        set -gx GTK_IM_MODULE fcitx
        set -gx QT_IM_MODULE fcitx
        set -gx XMODIFIERS @im=fcitx

        river
    end
end

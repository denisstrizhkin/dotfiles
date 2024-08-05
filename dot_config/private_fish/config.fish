# Source system profile
if not type -q bass
    set bass_path $HOME/.config/fish/bass
    git clone --depth 1 https://github.com/edc/bass.git $bass_path
    pushd $bass_path && make install && popd
end
bass source /etc/profile


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

        # setup runtime dir on openrc
        if test -z $XDG_RUNTIME_DIR
            set -gx XDG_RUNTIME_DIR (mktemp -d /tmp/(id -u)-runtime-dir.XXX)
        end

        hx --grammar fetch && hx --grammar build
        dbus-run-session river
    end
end

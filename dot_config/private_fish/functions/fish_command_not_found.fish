function fish_command_not_found
    set cmd $argv[1]

    if type -q apk
        set pkgs (apk search --quiet cmd:$cmd)
        set istr "apk add"
    end

    if type -q emerge
        set pkgs (e-file --plain $cmd | grep -E '^[^/]+/[^/]+$')
        set istr "emerge --ask"
    end

    set pkgs (string join ' | ' $pkgs[..10])
    echo "$cmd: not found"
    if test -n "$pkgs"
        echo "  install with: $istr [ $pkgs ]"
    end
end

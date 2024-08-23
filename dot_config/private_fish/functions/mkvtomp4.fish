function mkvtomp4
    for src in $argv[1..]
        if test (path extension $src) = .mkv
            set -l dest (path change-extension .mp4 $src)
            ffmpeg -i $src -c copy $dest
        end
    end
end

function mdtopdf
    set src $argv[1]
    if test (path extension $src) = .md
        set -l dest (path change-extension .pdf $src)
        pandoc --pdf-engine=weasyprint $src -o $dest
    end
end

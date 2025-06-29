function nz
    set -l dir $argv[1]
    if test -z "$dir"
    else
        z $dir
    end
    set file $(fzf)
    if test -n "$file"
        nvim $file
    else if test -n "$dir"
        cd $dir
    else
        echo "No file selected"
    end
end

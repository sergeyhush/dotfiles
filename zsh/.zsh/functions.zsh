function mkcd
{
    dir="$*";
    mkdir -p "$dir" && cd "$dir";
}

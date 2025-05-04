set -gx PATH '/Users/ssudakovich/.rbenv/shims' $PATH
set -gx RBENV_SHELL fish
command rbenv rehash 2>/dev/null
function rbenv
    set command $argv[1]
    set -e argv[1]

    switch "$command"
        case rehash shell
            rbenv "sh-$command" $argv | source
        case '*'
            command rbenv "$command" $argv
    end
end

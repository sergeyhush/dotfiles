function safe_exec --description "Execute command if binary exists, otherwise print message"
    set -l binary $argv[1]
    set -l command $argv[2..]

    if type -q $binary
        eval $command
        return $status
    else
        echo "$binary not found - skipping: $command" >&2
        return 0
    end
end

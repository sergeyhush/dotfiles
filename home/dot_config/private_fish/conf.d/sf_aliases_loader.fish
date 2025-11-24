## Load cached `sf` aliases for interactive shells
## This avoids spawning `sf` on every shell startup.

if not status is-interactive
    return
end

if type -q sf
    set -l sf_aliases_cache "$HOME/.config/fish/sf_aliases_cache.fish"
    if not test -f $sf_aliases_cache
        sf aliases --fish-shell > $sf_aliases_cache ^/dev/null
    end
    source $sf_aliases_cache 2>/dev/null
end



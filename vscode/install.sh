set -x
__basedir="$HOME/Library/Application Support/Code/User"
mkdir -p "$__basedir"
ln -fs "$PWD/settings.json" "$__basedir/settings.json"

for extension in $(cat "$PWD/extensions.txt"); do
    code --install-extension "$extension"
done
set +x

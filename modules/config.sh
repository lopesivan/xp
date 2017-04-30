# modules/config.sh

function xp.config.load () {

    b.unset 'xp.config'

    _xp.config.load_default_config

    return $?
}

function _xp.config.load_from_file () {

    local file="$1"

    local number_of_tasks=$(cat $file | jq '.xp[] .start' | wc -l)
    let number_of_tasks--
    for i in `seq 0 $number_of_tasks`; do

        local command=$(cat $file |
            jq --raw-output ".xp[$i].command")

        local description=$(cat $file |
            jq --raw-output ".xp[$i].description")

        b.set "xp.config.help_message_$command" "$description"
    done

    local name=$(cat $file | jq --raw-output ".id.name")

    local version=$(cat $file | jq --raw-output ".id.version")

    b.set "xp.config.name" "$name"
    b.set "xp.config.version" "$version"
    b.set "xp.config.author" "`git config --get user.name`"
    b.set "xp.config.email"  "`git config --get user.email`"

}

function _xp.config.load_default_config () {

    b.set "xp.config.help_message" '2'

    local file="$(dirname $(readlink -f $(which xp)))/etc/xpdoc.json"

    if [ -n "$file" ]; then                   # se variável não nula
        if [ -e "$file" ]; then               # se arquivo existe
            _xp.config.load_from_file "$file" # carrega arquivo

            return $?
        else
            b.raise FileNotFoundException     # se arquivo não encontrado
        fi
    else
        b.raise StringIsNullException         # se a variável é nula
    fi

    return 1
}

# vim: set ts=4 sw=4 tw=78 ft=sh:

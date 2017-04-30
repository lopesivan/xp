b.module.require unittest

# test:
# ➡ xp commands
function b.test.xp_commands () {
  local commands=( add commands completions
                   copy default e file git init keys
                   link ls new project
                   rm template usage x
                 )
  b.unittest.assert_equal \
    "$( echo ${commands[*]}| sort |xargs -n1 )" "$(xp commands)"
}

# test:
# ➡ xp commands --help
function b.test.xp_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which xp)))/etc/xpdoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="xp commands --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.xp[] | select(.command == "commands") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


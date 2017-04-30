b.module.require unittest

# test:
# ➡ xp completions
function b.test.xp_completions () {

  local cmd="$(
    echo '--help --version --usage' \
          '-a --add'                \
          '-l --list'               \
          '-n --name' |

    sed 's/ /\n/g' )"

  b.unittest.assert_equal \
    "${cmd}" "$(xp completions)"
}

# test:
# ➡ xp completions --help
function b.test.xp_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which xp)))/etc/xpdoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="xp completions --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.xp[] | select(.command == "completions") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


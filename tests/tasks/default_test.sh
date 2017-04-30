b.module.require unittest

# test:
# ➡ xp completions
function b.test.xp_default () {

  local output="Usage: xp [tasks] [options]"

  b.unittest.assert_equal \
    "${output}" "$(xp)"
}

# test:
# ➡ xp --help
function b.test.xp_long_option_help () {

  local f=$(dirname $(readlink -f $(which xp)))/tests/outfiles/xp__help.out

  local output="$(cat $f)"

  local cmd="xp --help"

  b.unittest.assert_equal \
    "$output" "$(${cmd})"
}

# test:
# ➡ xp --debug
function b.test.xp_long_option_debug () {

  local f=$(dirname $(readlink -f $(which xp)))/tests/outfiles/xp__debug.out

  local output="$(cat $f)"

  local cmd="xp --debug"

  b.unittest.assert_equal \
    "$output" "$(${cmd})"
}

# test:
# ➡ xp --debug --list
function b.test.xp_long_option_debug_list () {

  local f=$(dirname $(readlink -f $(which xp)))/tests/outfiles/xp__debug__list.out

  local output="$(cat $f)"

  local cmd="xp --debug --list"

  b.unittest.assert_equal \
    "$output" "$(${cmd})"
}

# test:
# ➡ xp --debug --add
function b.test.xp_long_option_debug_add () {

  local f=$(dirname $(readlink -f $(which xp)))/tests/outfiles/xp__debug__add.out

  local output="$(cat $f)"

  local cmd="xp --debug --add"

  b.unittest.assert_equal \
    "$output" "$(${cmd})"
}

# test:
# ➡ xp --debug --add --list
function b.test.xp_long_option_debug_add_list () {

  local f=$(dirname $(readlink -f $(which xp)))/tests/outfiles/xp__debug__add__list.out

  local output="$(cat $f)"

  local cmd="xp --debug --add --list"

  b.unittest.assert_equal \
    "$output" "$(${cmd})"
}

# test:
# ➡ xp --debug --list --add
function b.test.xp_long_option_debug_list_add () {

  local f=$(dirname $(readlink -f $(which xp)))/tests/outfiles/xp__debug__add__list.out

  local output="$(cat $f)"

  local cmd="xp --debug --list --add"

  b.unittest.assert_equal \
    "$output" "$(${cmd})"
}

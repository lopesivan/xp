b.module.require str
b.module.require unittest

function b.test.xp_task_commands () {
  local commands=( add commands completions
                   copy default e file keys
                   link ls new project
                   rm template usage x
                 )
  b.unittest.assert_equal \
    "$( echo ${commands[*]}| sort |xargs -n1 )" "$(xp commands)"
}

function net_up? () {
  ping -c1 8.8.8.8 &> /dev/null
}

function print_net_stats () {
  if net_up?; then
    echo "UP"
  else
    echo "DOWN"
  fi
}

function b.test.mocking_up () {
  function net_up () { return 0; }

  b.unittest.double.do net_up? net_up
  b.unittest.assert_equal \
    "UP" "$(print_net_stats)"

  b.unittest.double.undo net_up?
}

function b.test.mocking_down () {
  function net_down { return 1; }

  b.unittest.double.do net_up? net_down
  b.unittest.assert_equal \
    "DOWN" "$(print_net_stats)"

  b.unittest.double.undo net_up?
}

function b.test.in_array () {
  local foo=('bar')
  # True!
  in_array? "bar" "foo"
  b.unittest.assert_success $?
  # False!
  in_array? " bar" "foo"
  b.unittest.assert_error $?
}

function b.test.trim () {
  b.unittest.assert_equal \
    'ABC' "$(b.str.trim "ABC ")"
}

function b.test.its_success () {
  b.unittest.assert_equal 'a' 'a'
}

function b.test.error () {
  b.unittest.assert_equal 'a' 'a'
}

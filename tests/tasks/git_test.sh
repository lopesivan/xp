b.module.require unittest

# test:
# ➡ xp git --help
function b.test.xp_git_long_option_help () {

  local f=$(dirname $(readlink -f $(which xp)))/tests/outfiles/xp_git__help.out

  local output="$(cat $f)"

  local cmd="xp git --help"

  b.unittest.assert_equal \
    "$output" "$(${cmd})"
}

# test:
# ➡ xp git --debug
function b.test.xp_git_long_option_debug () {

  local f=$(dirname $(readlink -f $(which xp)))/tests/outfiles/xp_git__debug.out

  local output="$(cat $f)"

  local cmd="xp git --debug"

  b.unittest.assert_equal \
    "$output" "$(${cmd})"
}


# test:
# ➡ xp git --set-ssh-git
function b.test.xp_git_long_option_set_ssh_git () {

  local tempdir=$(mktemp -d -t testing.XXXX)
  local repname=test-repositorio

  cd $tempdir
  git novo-repositorio-local $repname
  cd ${tempdir}/${repname}

  local output="\
git remote -v
git remote set-url origin git+ssh://git@github.com/lopesivan/${repname}.git
git remote -v"

  local cmd="xp git --set-ssh-git"

  b.unittest.assert_equal \
    "$output" "$(${cmd})"

  rm -rf ${HOME}/git/${repname}.git
  rm -rf $tempdir

}

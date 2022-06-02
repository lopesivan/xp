# modules/exit.sh
function xp.exit._error() {
  exec 4>&1 # stdout duplicado ( FD 4 tem as mesmas caracteristicas
            # do STDOUT), aponta para o terminal.
  exec 1>&2

  echo `tput bold tput setb 3`ERROR: `tput setaf 1` "$*"  `tput sgr0`

  exec 1>&4 # FD 1 recebe as caracteristicas de FD 4.
            # FD 1 ressetado.
  exec 4>&- # FD 4 eh liberado.
}

# The error function print menssage of error.
function xp.exit._abort_now () {
  xp.exit._error '***' aborted '***'
  return 1
}
# vim: set ts=4 sw=4 tw=78 ft=sh:

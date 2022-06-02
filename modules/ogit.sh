# modules/ogit.sh
function xp.ogit.load () {
  b.opt.add_flag --help "$(b.get "xp.config.help_message_git")"
  b.opt.add_flag --debug "enable debug mode"

  b.opt.add_flag --hub "Set project to remote repository"

  b.opt.add_flag --set-ssh-git "Associate the SSH key with the remote repository"
  b.opt.add_alias --set-ssh-git -no-pass

  b.opt.add_flag --remote-to-local "Set remote project to local repository"
  b.opt.add_flag --set-local-git "Set project to local repository"
  b.opt.add_flag -rm "remove local repository"
  b.opt.add_flag --purge "remove local repository and delete current dir"
  b.opt.add_alias --purge -P

}

# vim: set ts=4 sw=4 tw=78 ft=sh:

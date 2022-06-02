# modules/oproject.sh

function xp.oproject.load () {
  b.opt.add_flag --help "$(b.get "xp.config.help_message_project")"
  b.opt.add_flag --debug "enable debug mode"

  b.opt.add_flag --list "PROJECTlista os paths dos x-projects"
  b.opt.add_alias --list -l

  b.opt.add_opt --name "Specify name to be used"
  b.opt.add_alias --name -n

  b.opt.add_opt --package "Specify package to be used"
  b.opt.add_alias --package -p

  # Set required args (will raise errors if not specified)
  b.opt.required_args --name
  b.opt.required_args --package
}

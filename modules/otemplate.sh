# modules/otemplate.sh

function xp.otemplate.load () {
  b.opt.add_flag --help "$(b.get "xp.config.help_message_template")"
  b.opt.add_flag --debug "enable debug mode"

  b.opt.add_flag --list "lista os paths dos x-projects"
  b.opt.add_alias --list -l

  b.opt.add_opt --name "Specify name to be used"
  b.opt.add_alias --name -n

  # Set required args (will raise errors if not specified)
  b.opt.required_args --name
}

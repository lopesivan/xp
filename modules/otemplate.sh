# modules/otemplate.sh

function xp.otemplate.load () {
  b.opt.add_flag --help "$(b.get "xp.config.help_message_template")"
  b.opt.add_flag --debug "enable debug mode"

  b.opt.add_flag --list "TEMPLATElista os paths dos x-projects"
  b.opt.add_alias --list -l

  b.opt.add_flag --save "Salva templates como arquivos"
  b.opt.add_alias --save -s

  b.opt.add_flag --print "Imprime na tela os templates"
  b.opt.add_alias --print -p

  b.opt.add_flag --template "Copia templates e arquivos de configuração"
  b.opt.add_alias --template -t

  b.opt.add_opt --yaml "Especifica o arquivo yaml"
  b.opt.add_alias --yaml -y

  b.opt.add_opt --number "Specify number to be used"
  b.opt.add_alias --number -n

  # Set required args (will raise errors if not specified)
  b.opt.required_args --number

  # # Set required args (will raise errors if not specified)
  # b.opt.required_args --yaml
}

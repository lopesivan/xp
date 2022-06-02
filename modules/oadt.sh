# modules/oadt.sh
function xp.oadt.load () {
  b.opt.add_flag --help "$(b.get "xp.config.help_message_adt")"
  b.opt.add_flag --debug "enable debug mode"

  b.opt.add_flag --save "Salva templates como arquivos"
  b.opt.add_alias --save -s

  b.opt.add_flag --template "Copia templates e arquivos de configuração"
  b.opt.add_alias --template -t

  b.opt.add_opt --yaml "Especifica o arquivo yaml"
  b.opt.add_alias --yaml -y

  ## Set required args (will raise errors if not specified)
  #b.opt.required_args --yaml

}

# vim: set ts=4 sw=4 tw=78 ft=sh:

# modules/options.sh

function xp.options.load () {
  # Help (--help and -h added as flags)
  b.opt.add_flag --debug "enable debug mode"
  b.opt.add_flag --help "display this help and exit"
  b.opt.add_flag --version "output version information and exit"

  b.opt.add_flag --add "adiciona path dos arquivos presentes no diretório"
  b.opt.add_alias --add -a

  b.opt.add_flag --list "lista os paths dos x-projects"
  b.opt.add_alias --list -l

  b.opt.add_opt --name "Specify name to be used"
  b.opt.add_alias --name -n

  # Set required args (will raise errors if not specified)
  #b.opt.required_args --name
}

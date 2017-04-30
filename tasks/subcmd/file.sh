# tasks/file.sh
function btask.file.run() {
   # if [ "$1" == '--help' ]; then
   #    b.get "xp.config.help_message_file"

   #    return $( b.get "xp.config.help_message" )
   # fi

   echo file

   xp.ofile.load
   b.opt.init "$@"

   if b.opt.has_flag? --debug; then

      # --list| -l
      if b.opt.has_flag? --list; then
         echo "list ON"
      else
         echo "list OFF"
      fi
      # --name| -n
      if b.opt.check_required_args; then
         local name="$(b.opt.get_opt --name)"
         echo NAME=$name
      fi

      return 1
   fi

   if b.opt.has_flag? --help; then
      b.opt.show_usage
      return 1
   fi
}

# vim: set ts=4 sw=4 tw=78 ft=sh:

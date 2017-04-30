# tasks/new.sh
function btask.new.run() {
    if [ "$1" == '--help' ]; then
        b.get "xp.config.help_message_new"

        return $( b.get "xp.config.help_message" )
    fi

   echo -n new:
   b.task.run "$@"
}

# vim: set ts=4 sw=4 tw=78 ft=sh:

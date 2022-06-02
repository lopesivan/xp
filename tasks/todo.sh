# tasks/todo.sh
function btask.todo.run() {
    if [ "$1" == '--help' ]; then
        b.get "xp.config.help_message_todo"

        return $( b.get "xp.config.help_message" )
    fi

    local exe="exec --no-startup-id"
    local TERMINAL=st
	i3 "$exe $TERMINAL -n wldoc -e sh -c ${HOME}/developer/scripts/show-edit-ldoc/docs1.sh"
}

# vim: set ts=4 sw=4 tw=78 ft=sh:

# tasks/nvim.sh
function btask.nvim.run() {
    if [ "$1" == '--help' ]; then
        b.get "xp.config.help_message_nvim"

        return $( b.get "xp.config.help_message" )
    fi


	echo ksksksksksskkssk
    return $?
}

# vim: set ts=4 sw=4 tw=78 ft=sh:

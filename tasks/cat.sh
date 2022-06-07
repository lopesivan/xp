# tasks/cat.sh
function btask.cat.run() {
	if [ "$1" == '--help' ]; then
		b.get "xp.config.help_message_cat"

		return $(b.get "xp.config.help_message")
	fi

    if [ -n "$1" ]; then
        source __REDIS_BASH_LIB__ # include the library
        exec 6<>/dev/tcp/localhost/6379                    # open the connection
        # isOK
        redis-cli TYPE $1| grep -q 'zset'
        if [ $? -eq 0 ]; then
            if [ $# -eq 1 ]; then
                file=$( redis-cli ZRANGE $1 0 -1 |
                    fzf)
            else
                file=$( redis-cli ZRANGE $1 0 -1 |
                    fzf )
            fi
            [ -n "$file" ] && {
                cat $file
            }
        else
            redis-cli get $1 | xargs cat
        fi
        # close the connection
        exec 6>&-
    fi

	return $?
}

# vim: set ts=4 sw=4 tw=78 ft=sh:

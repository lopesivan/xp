# tasks/init.sh
function btask.init.run() {

    local file="$(dirname $(readlink -f $(which xp)))/etc/xp.completion.bash"

    if [ -n "$file" ]; then
        if [ -e "$file" ]; then
            cat $file
        else
            b.raise FileNotFoundException
        fi
    else
        b.raise StringIsNullException
    fi

}

# vim: set ts=4 sw=4 tw=78 ft=sh:

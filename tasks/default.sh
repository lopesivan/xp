# tasks/default.sh

function _version (){
    cat <<EOF
$(b.get "xp.config.name") (42algoritmos tools) $(b.get "xp.config.version")
Copyright (C) 2008 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by $(b.get "xp.config.author").
EOF
}

function btask.default.run() {

    xp.options.load

    b.opt.init "$@"

    if b.opt.has_flag? --debug; then

        # --help
        if b.opt.has_flag? --help; then
            echo "help ON"
        else
            echo "help OFF"
        fi
        # --add| -a
        if b.opt.has_flag? --add; then
            echo "add ON"
        else
            echo "add OFF"
        fi
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

    if b.opt.has_flag? --version; then
        _version
        return 1
    fi

    if b.opt.has_flag? --help; then
        b.opt.show_usage
        return 1
    fi

}

# vim: set ts=4 sw=4 tw=78 ft=sh:

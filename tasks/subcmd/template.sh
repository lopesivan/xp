# tasks/template.sh
function btask.template.run() {
    # if [ "$1" == '--help' ]; then
    #     b.get "xp.config.help_message_template"

    #     return $( b.get "xp.config.help_message" )
    # fi

    xp.otemplate.load
    b.opt.init "$@"

    if b.opt.has_flag? --debug; then
        # STATES OF OPTIONS
        local state=""
        # --list| -l
        if b.opt.has_flag? --list; then
            state="ON"
        else
            state="OFF"
        fi
        echo list ${state}
        #
        # --number| -n
        #
        if b.opt.check_required_args; then
            local number="$(b.opt.get_opt --number)"
        fi
        echo number=$number
        #
        # --yaml| -y
        #
        if b.opt.check_required_args; then
            local yaml="$(b.opt.get_opt --yaml)"
        fi
        echo yaml=$yaml
        #
        local save="OFF"
        local print="OFF"
        #
        # --save| -s
        #
        if b.opt.has_flag? --save; then
            save="ON"
            print="OFF"
        fi
        #
        # --print| -p
        #
        if b.opt.has_flag? --print; then
            print="ON"
            save="OFF"
        fi

        echo save ${save}
        echo print ${print}

        return 1
    fi

    if b.opt.has_flag? --help; then
        b.opt.show_usage
        return 1
    fi

    ##############################################################################
    ##############################################################################
    ##############################################################################

    declare -A templates

    templates[1]="${HOME}/developer/template-code/w-cmd"
    templates[2]="${HOME}/developer/template-code/w-ip"
    templates[3]="${HOME}/developer/template-code/w-autotools-cansi"

    # --list| -l
    if b.opt.has_flag? --list; then
        local n=1
        for template in ${templates[@]}; do
            echo \($n\) - ${template##*/}
            let n++
        done
    else
        if b.opt.check_required_args; then
            #
            # -n <number>
            #
            local number="$(b.opt.get_opt --number)"
            # pwd
            cd $LOCALPATH
            #
            DIR=${templates[$number]}/w/v
            APP=${DIR}/app.py
            #
            if b.opt.has_flag? --template; then
                for f in ${DIR}/*.yml; do
                    orig=$f
                    dest=${f##*/}
                    if [ -e "$orig" ]; then
                        if [ -e "$dest" ]; then
                            echo `tput bold tput setb 3` action: `tput setaf 3` "File already exists!"  `tput sgr0`
                        else
                            echo `tput bold tput setb 3` action: `tput setaf 2` "copying ${dest##*/} to local directory"  `tput sgr0`
                            cp $orig $dest
                        fi
                    else
                        echo `tput bold tput setb 3` action: `tput setaf 1` "The ${dest##*/} file does not exist"  `tput sgr0`
                    fi
                done
            else # not --template
                local cmd="python ${APP}"
                local opt=""

                # save source
                if b.opt.has_flag? --save; then
                    opt="-s"
                fi

                # print stdout
                if b.opt.has_flag? --print; then
                    opt="-p"
                fi

                if b.opt.check_required_args; then
                    #
                    # -y <file>
                    #
                    local file="$(b.opt.get_opt --yaml)"
                    #
                    if [ -n "$file" -a -n "$opt" ]; then     # se variável não nula
                        if [ -e "$file" ]; then              # se arquivo existe
                            export PYENV_VERSION=neovim2
                            # DO STUFF
                            # python --version # ==> Python 2.7.10
                            ${cmd} ${opt} -y "$file"          # carrega arquivo
                            # Reset version
                            unset PYENV_VERSION
                            return $?
                        else
                            b.raise FileNotFoundException     # se arquivo não encontrado
                            xp.exit._error "Arquivo yaml não não encontrado!"
                            xp.exit._abort_now
                        fi
                    else
                        b.raise StringIsNullException         # se a variável é nula
                        xp.exit._error "Variável é nula!"
                        xp.exit._error "Use -p para imprimir em stdout"
                        xp.exit._error "Ou use -s para salvar em arquivos"
                        xp.exit._abort_now
                    fi
                fi # --template
            fi

        else # if --number is empty
            echo USAGE:
            echo 'xp new template {-n|--number} <number> [-p|--print|-s|--save] [-y|--yaml] <file>'
            echo 'xp new template -l'
            echo 'xp new template {-n|--number} <number> {-t|--template}'
        fi
    fi

    return $?
}
# vim: set ts=4 sw=4 tw=78 ft=sh:

# tasks/adt.sh
function btask.adt.run() {

    xp.oadt.load
    b.opt.init "$@"

    if b.opt.has_flag? --debug; then
        # STATES OF OPTIONS
        local state="OFF"
        # --save| -s
        if b.opt.has_flag? --save; then
            state="ON"
        fi
        echo save ${state}
        #
        # --yaml| -y
        #
        if b.opt.check_required_args; then
            local yaml="$(b.opt.get_opt --yaml)"
        fi
        echo yaml=$yaml
    fi

    if b.opt.has_flag? --help; then
        b.opt.show_usage
        return 1
    fi

    ##############################################################################
    ##############################################################################
    ##############################################################################

    declare -A templates

    templates[1]="${HOME}/developer/vim/vim/cheetah/cansi/adt"

    if b.opt.check_required_args; then
        # pwd
        cd $LOCALPATH
        #
        DIR=${templates[1]}/view
        APP=${DIR}/command.py
        #
        if b.opt.has_flag? --template; then
            for f in ${templates[1]}//exemplos/01/*.yaml; do
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
                opt="-w"
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
                        ${cmd} ${opt} -f "$file"          # carrega arquivo
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

    else
        echo USAGE:
        echo 'xp adt [-s|--save] [-y|--yaml] <file>'
        echo 'xp adt {-t|--template}'
    fi

    return $?
}
# vim: set ts=4 sw=4 tw=78 ft=sh:
# vim: set ts=4 sw=4 tw=78 ft=sh:

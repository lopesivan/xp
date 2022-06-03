# tasks/git.sh
function btask.git.run() {

	xp.ogit.load
	b.opt.init "$@"

	if b.opt.has_flag? --debug; then

		# comando para gerar chave
		# ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
		# --list| -l
		if b.opt.has_flag? --set-ssh-git; then
			echo "SET_SSH_GIT ON"
		else
			echo "SET_SSH_GIT OFF"
		fi

		if b.opt.has_flag? --set-local-git; then
			echo "SET_LOCAL_GIT ON"
		else
			echo "SET_LOCAL_GIT OFF"
		fi

		if b.opt.has_flag? -rm; then
			echo "SET_RM ON"
		else
			echo "SET_RM OFF"
		fi

		if b.opt.has_flag? --purge; then
			echo "SET_PURGE ON"
		else
			echo "SET_PURGE OFF"
		fi

		if b.opt.has_flag? --remote-to-local; then
			echo "SET_REMOTE_TO_LOCAL ON"
		else
			echo "SET_REMOTE_TO_LOCAL OFF"
		fi
		return 1
	fi

	if b.opt.has_flag? --help; then
		b.opt.show_usage
		return 1
	fi

	local localrepo_vc_dir=$LOCALPATH/.git

	if [ ! -d $localrepo_vc_dir ]; then
		b.opt.show_usage
		return 1
	fi

	if b.opt.has_flag? --hub; then
		cd $LOCALPATH
        cat <<EOF
        git remote -v
        hub remote remove origin
        hub remote add origin
        git remote -v
        git branch -m master main
        git push --set-upstream origin main
EOF
	fi

	if b.opt.has_flag? --set-ssh-git; then
		cd $LOCALPATH
		local github_user=$(git config --get "github.user")
		local github_name=$(basename $(git rev-parse --show-toplevel))
		echo git remote -v
		echo git remote set-url origin \
			git@github.com:${github_user}/${github_name}.git
		echo git remote -v
	fi

	if b.opt.has_flag? --set-local-git; then
		cd $LOCALPATH
		local github_name=$(basename $(git rev-parse --show-toplevel))
		echo git remote -v
		echo git remote set-url origin \
			file://\${HOME}/git/${github_name}.git
		echo git remote -v
	fi

	if b.opt.has_flag? -rm; then
		cd $LOCALPATH
		local github_name=$(basename $(git rev-parse --show-toplevel))
		echo rm -rf ${HOME}/git/${github_name}.git
		if b.opt.has_flag? --purge; then
			echo rm -rf ${PWD}
		fi
	fi

	if b.opt.has_flag? --remote-to-local; then

		cd $LOCALPATH

		local GIT=${HOME}/git
		local github_name=$(basename $(git rev-parse --show-toplevel))
		local git_dir=$GIT/${github_name}.git

		if test -d $git_dir; then
			echo -e "O projeto já existe! em $github_name"
			exit 1
		else
			mkdir -p $git_dir &&
				cd $_ &&
				git init --bare

			cd $LOCALPATH
			git remote -v
			git remote set-url origin \
				file://${HOME}/git/${github_name}.git
			git remote -v
			git push
		fi
	fi
}

# vim: set ts=4 sw=4 tw=78 ft=sh:

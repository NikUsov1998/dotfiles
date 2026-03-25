#!/bin/bash

root_check()
{
	if [ "$(id -u)" -eq 0 ]; then
		echo "Updating configs..."
	else
		echo "Script must be run as root!"
		exit 1
	fi
}

pkmg_detection()
{
	PKGMGRS=(
		"xbps-install"
		"apt"
		"apt-get"
		"pacman"
		"zypper"
		"snap"
	)

	for cmd in "${PKGMGRS[@]}"; do
		if command -v "$cmd" &> /dev/null; then
			echo $cmd
			break
		else
			exit 1
		fi
	done
}
packets_install()
{
	local -n PACKETS_ARR=$1 
	for PACK in "${PACKETS[@]}"; do
		$PKMG $OPTIONS $PACK
	done
}

packets_print()
{
	local -n PACKETS_ARR=$1 
	for PACK in "${PACKETS_ARR[@]}"; do
		echo "$(xbps-query -l | grep $PACK)"
	done
}

mv_configs()
{
	cp ./zshrc /etc/zsh/zshrc
	#cp ./rc.conf /etc/rc.conf
	#cp ./rc.local /etc/rc.local 
	rm -rf /home/$(ls)/.config/nvim
	rm -rf /home/$(ls)/.config/htop
	cp -rvf ./nvim /home/$(ls)/.config/nvim
	cp -rvf ./htop /home/$(ls)/.config/htop
}

mv_configs_test()
{
	cp ./zshrc ~/Desktop/installer_test/
	cp ./rc.conf ~/Desktop/installer_test/
	cp ./rc.local ~/Desktop/installer_test/
	cp -rfv ./nvim ~/Desktop/installer_test/
	cp -rfv ./htop ~/Desktop/installer_test/
}

main()
{
	PKMG=$(pkmg_detection)
	echo $PKMG
	#$PKMG -Suy # Update system 
	COMMAND=""
	OPTIONS="-Sy"

	PACKETS=(
		"zsh"  # Better shell 
		"zsh-autosuggestions"
		"zsh-completions"
		"zsh-history-substring-search"
		"zsh-syntax-highlighting"
		"htop"
		"neovim"  # best code editor ever
		"tree"
		"git"
		"fastfetch"  # ricing
		"gcc"
		"gdb"
		"mypy"
		"nerd-fonts"  # Make Nvim look pretty
		"tmux"
		"timeshift"
		"docker"
		"docker-compose"
		"screen"
		"StyLua"
		"clang"  # for C language server
		"clang-tools-extra"
		"clang-analyzer"
		"ruff"  # Linter
		"python3-isort"  # import sorting
		"fzf"
		"xclip" # system clipboard plugin
		"lsof"
		"python3-lsp-server"
		"python3-language-server"
		"bash-language-server" # for old x32 laptop use "sudo npm install -g bash-language-server@4.0.0" newer versions cause FatalOOM
		"cmake-language-server"
		"lua-language-server"
		"wmctrl" # quick navigation trough workspaces
	)
	root_check
	pkmg_detection
	packets_install PACKETS
	packets_print PACKETS
	mv_configs
	echo chown -Rh $(ls /home/):$(ls /home/) /home/$(ls /home/)/.config/nvim 
	chown -Rh $(ls /home/):$(ls /home/) /home/$(ls /home/)/.config/nvim 
	reboot
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	main "$@"
fi

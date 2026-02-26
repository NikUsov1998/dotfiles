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
	cp ./rc.conf /etc/rc.conf
	cp ./rc.local /etc/rc.local 
	cp -r ./nvim ~/.config/nvim
	cp -r ./htop ~/.config/htop
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
	$PKMG -Suy # Update system 
	COMMAND=""
	OPTIONS="-y"

	PACKETS=(
		"zsh"
		"zsh-autosuggestions"
		"zsh-completions"
		"zsh-history-substring-search"
		"zsh-syntax-highlighting"
		"htop"
		"neovim"
		"tree"
		"git"
		"fastfetch"
		"gcc"
		"gdb"
		"mypy"
		"nerd-fonts"
		"tmux"
		"timeshift"
		"docker"
		"docker-compose"
		"screen"
	)
	root_check
	pkmg_detection
	packets_install PACKETS
	packets_print PACKETS
	mv_configs
	reboot
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	main "$@"
fi

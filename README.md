# DOTFILES
## Big thanks to [MartinLwx](github.com/MartinLwx/dotfiles), this repo was inspired by him
### What in this repo
    Since this repo is wrapper, i mostly removed useless for me packets from Martins config of nvim
    1) I changed lsp packet from blink.cmp to nvim.cmp cuz blink does not have x32 binaries out of the box, and nvim.cmp had one
    2) Disable flash.nvim, i prefer default behaviour of 's' in vim, and didn't find plugin useful for me to reconfigure
    3)  
### How to install
You cat run install script, but because i created this one for myself it can contain useless packages for you,
see in install.sh and choose which packages you need.
```bash
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
```
### How to configure


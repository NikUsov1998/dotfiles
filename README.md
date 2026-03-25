# DOTFILES
## Big thanks to [MartinLwx](github.com/MartinLwx/dotfiles), this repo was inspired by him
### What in this repo
    Since this repo is wrapper, i mostly removed useless for me packets from Martins config of nvim
    1) I changed lsp packet from blink.cmp to nvim.cmp cuz blink does not have x32 binaries out of the box, and nvim.cmp had one
    2) Disable flash.nvim, i prefer default behaviour of 's' in vim, and didn't find plugin useful for me to reconfigure
### How to install
You cat run install script, but because i created this one for myself it can contain useless packages for you,
see in install.sh and choose which packages you need.
```bash
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
		"bash-language-server" 
		"cmake-language-server"
		"lua-language-server"
		"wmctrl" # quick navigation trough workspaces
	)
```
### How to configure
#### For x32 system
    I find my old laptop quite gorgeous so here its most valuable configuration for you to compare with your hardware
        * Intel Pentium 780 M 2.2 GHz
        * 2 Gb of DDR1 333MHz
    As you can see its quite slow by modern standarts, so for it to run this nvim config in all its glory
    1. **After** execution of install.sh you must remove bash-language-server in your package manager;
        in my case its:
```bash 
    xbps-remove bash-language-server
```
    2. Use:
```bash 
    sudo npm install -g bash-language-server@4.0.0
```
    This actions helped me with FatalOOM error that drive bash-language-server to collapse

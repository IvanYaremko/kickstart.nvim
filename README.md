# Ivan's Modular Kickstart.nvim

## Introduction
This is a personal, modular fork of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). Unlike the original single-file version, this configuration is decoupled into logical modules for easier maintenance and portability.

---

## Configuration Structure
```
~/.config/nvim/
├── init.lua              # Entry point & Lazy.nvim bootstrap
└── lua/
    ├── core/
    │   ├── options.lua   # Native Neovim settings
    │   └── keymaps.lua   # Basic mappings & custom Git shortcuts
    └── plugins/
        ├── ui.lua        # Theme, Neo-tree, Trouble, & Which-key
        ├── lsp.lua       # LSP Config, Mason, & Autocompletion
        ├── telescope.lua # Fuzzy finding
        ├── treesitter.lua # Syntax highlighting
        └── session.lua   # resession.nvim config
```

## Installation
Linux:
```
git clone [https://github.com/IvanYaremko/kickstart.nvim.git](https://github.com/IvanYaremko/kickstart.nvim.git) "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

Windows:
```
git clone [https://github.com/IvanYaremko/kickstart.nvim.git](https://github.com/IvanYaremko/kickstart.nvim.git) "${env:LOCALAPPDATA}\nvim"
```

## Post Installation
```
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```


### Latest neovim
```
1. Download the latest stable release
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage

2. Make it executable
chmod u+x nvim-linux-x86_64.appimage

3. Move it to a permanent home
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim
```
### Bashrc
```
alias update-nvim='curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage && chmod u+x nvim-linux-x86_64.appimage && sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim'
```

# Dot Files for `onboardme`

These started as my personal dot files, but then they became the sensible
 defaults for `onboardme`, what started out as a script to manage my dot files.
 Funny how these things work. :shrug:

 Below you'll find sections for each config file, organized by how they show up in github.


<details>
  <summary>.config</summary>

  <blockquote>
  
  Below are directories that would be located in your home directory, under `.config`:

  <details>
    <summary>asciinema</summary>
    
  <blockquote>
    
  File: [`~/.config/asciinema/config`](.config/asciinema/config)

  Config file for [`asciinema`](https://asciinema.org/), a lightweight, purely text-based approach to terminal recording. Currently it just sets the shell command to be `/bin/bash --login`, which loads your bash variables. This could be changed to a different shell and their equivilent.
  
  </blockquote>
    
  </details>
    

  <details>
    <summary>gh</summary>
    
  <blockquote>
    
  File: [`~/.config/gh/config.yml`](.config/gh/config.yml)

  Config file for [`gh`](https://cli.github.com/), the GitHub CLI. There's not a ton in there, but it uses [`rich-cli`](https://github.com/Textualize/rich-cli) as a prettier pager, and firefox as a browser, and setting vim as an editor. The rest is stock, and subject to change.
  
  </blockquote>
    
  </details>
  
  <details>
    <summary>glab-cli</summary>
    
  <blockquote>
    
  File: [`~/.config/glab-cli/config.yml`](.config/glab-cli/config.yml)

  Config file for [`glab`](https://glab-cli.io/), an open source GitLab CLI tool. There's not a ton in there, but it uses a dark theme, firefox as a browser, and vim as an editor.  The rest is stock, and subject to change.
  
  </blockquote>
    
  </details>
  
  <details>
    <summary>karabiner</summary>
    
  <blockquote>
  
  File: [`~/.config/karabiner/karabiner.json`](.config/karabiner/karabiner.json)

  Config file for [karabiner](https://karabiner-elements.pqrs.org/),
  which is used to map capslock to control on macOS and other key remapping that
  can be really useful.
  
  </blockquote>
    
  </details>
  
  <details>
    <summary>kitty</summary>
    
  <blockquote>
    
  Files:
  - [`~/.config/kitty/kitty.conf`](.config/kitty/kitty.conf)
  - [`~/.config/kitty/kitty-dark.png`](.config/kitty/kitty-dark.png)

  Config files related to [kitty](https://sw.kovidgoyal.net/kitty/), a terminal emulator.
  Cute open source kitty icon image by [DinkDonk](https://github.com/DinkDonk/kitty-icon),
  as well as a basic kitty.conf to use some [nerdfonts](https://www.nerdfonts.com/),
  and set up look and feel on macOS.
  
  </blockquote>

  </details>
  
  <details>
    <summary>lsd</summary>
    
  <blockquote>
    
  File: [`~/.config/lsd/config.yaml`](.config/lsd/config.yaml)

  Config file for [`lsd`](https://github.com/Peltoche/lsd), an [`ls`](https://linux.die.net/man/1/ls) alternative with icons and pretty colors. There's an intension to write and release a theme for lsd eventually.
  
  </blockquote>
  
  </details>
  
  <details>
    <summary>lsimg</summary>
    
  <blockquote>
    
  File: [`~/.config/lsimg/config.yaml`](.config/lsimg/config.yaml)

  This is a local project that I'm working on to rewrite a bash script in python,
  to do basic checking of images in the terminal. I might remove it though,
  because after discovering [ranger](https://github.com/ranger/ranger), it might not be really needed :shrug:
  
  </blockquote>

  </details>
  
  <details>
    <summary>neofetch</summary>
    
  <blockquote>
    
  File: [`~/.config/neofetch/config.conf`](.config/neofetch/config.conf)

  Config file for [neofetch](https://github.com/dylanaraps/neofetch), A command-line system information tool written in bash 3.2+. The intension is to pair down information to only what's needed, and maybe have a cute image :)
  
  </blockquote>
    
  </details>
  
  <details>
    <summary>nvim</summary>
    
  <blockquote>
    
  Config files for [neovim](https://neovim.io/) is a hyperextensible Vim-based text editor, which is in some ways a sucessor to vim. It's a lot faster, for one, and there's more support for more languages, which means more plugins. Uses [packer](https://github.com/wbthomason/packer.nvim) to manager neovim plugins.

  Each file explained below:

  ### [`init.lua`](.config/nvim/init.lua)
  The main global configuration changes are:
  - turning off mouse scrolling
  - enabling line numbers
  - adding a cursorline
  - setting column 80 to be a different color for tidy code
  - enabling gui colors so you aren't limited to like 8 colors
  - uses the [spacechalk](https://github.com/jessebot/space-chalk) colorscheme
  - sources all the files in [~/.config/nvim/lua](.config/nvim/lua), including packer, plugins, and local plugin configs.

  ### [`~/.config/nvim/packerinit.vim`](.config/nvim/packerinit.vim)
  This is a quick and dirty lua function to print " ♥ ♥ ♥ " if neovim is running in an interactive session and packer completes an action, and to exit if we're running headless, meaning we're running in a script.

  ### [`~/.config/nvim/lua/plugins.lua`](.config/nvim/lua/plugins.lua)
  This is the configuration for packer, our plugin manager for neovim. It installs packer, and then all of our plugins. You can check out all the plugins that are installed, or called from vim plugins [here](https://github.com/jessebot/dot_files/blob/main/.config/nvim/lua/plugins.lua#L15).

  ### [`~/.config/nvim/lua/user/airline.lua`](.config/nvim/lua/user/airline.lua)
  This local config file sets defaults for [airline](https://github.com/vim-airline/vim-airline), a status line for vim and neovim. The configurations are:
  - use space_chalk theme
  - enables powerline fonts (fun icons)
  - disables empty sections of the status line
  - enables the ale extension to work with airline for linting
  - changes the default dividers to be   and '
  - sets a line number percentage function for a slimmer ln segment

  ### [`~/.config/nvim/lua/user/ale.lua`](.config/nvim/lua/user/ale.lua)
  local config sets defaults for [ale](https://github.com/dense-analysis/ale) such as:
  - enable ale by default
  - error icons are now  and warn icons are now 
  - don't lint on text changes, only on mode changes
  - use lints for python such as ruff and flake8
  - run autofixers on save
  - move between errors

  ### [`~/.config/nvim/lua/user/dashboard.lua`](.config/nvim/lua/user/dashboard.lua)
  local config for a starting screen [dashboard](https://github.com/glepnir/dashboard-nvim) for neovim. You should just check out the file to see what's being done. It's cute ascii art and utilizes [telescope](https://github.com/nvim-telescope/telescope.nvim) to check out your files and previously opened files.

  ### [`~/.config/nvim/lua/user/folding.lua`](.config/nvim/lua/user/folding.lua)
  local config file to enable folding, which is just vim speak for collapsing blocks of code. Sets some defaults.

  ### [`~/.config/nvim/lua/user/nvim-tree.lua`](.config/nvim/lua/user/nvim-tree.lua)
  local config file for [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua), a neovim file explorer written in lua, with icons.

  Opens on opening of any file, and auto-adjusts its window size.

  ### [`~/.config/nvim/lua/user/tree-sitter.lua`](.config/nvim/lua/user/tree-sitter.lua)
  local config file for the nvim [tree-sitter](https://github.com/nvim-treesitter/nvim-treesitter) plugin, which helps with syntax highlighting of various things.

  currently installing syntax for: "lua", "yaml", "bash", "hcl"
  
  </blockquote>

  </details>
  
  <details>
    <summary>Powerline</summary>
    
  <blockquote>
    
  Configuration files for [powerline](https://github.com/powerline/powerline), a status line for BASH and tmux. We enable a space_chalk color theme, as well as battery information, git information, and local IP address.

  Files for colors:
  - [`~/.config/powerline/colors.json`](.config/powerline/colors.json)
  - [`~/.config/powerline/colorschemes/default.json`](.config/powerline/colorschemes/default.json)
  - [`~/.config/powerline/colorschemes/shell/default.json`](.config/powerline/colorschemes/shell/default.json)

  Files for configuring powerline for a login shell, and the console shell:
  - [`~/.config/powerline/themes/shell/default.json`](.config/powerline/themes/shell/default.json)
  - [`~/.config/powerline/themes/powerline.json`](.config/powerline/themes/powerline.json)
  - [`~/.config/powerline/themes/powerline_terminus.json`](.config/powerline/themes/powerline_terminus.json)
  - [`~/.config/powerline/themes/unicode_terminus.json`](.config/powerline/themes/unicode_terminus.json)

  File for configuring tmux status line:
  - [`~/.config/powerline/themes/tmux/default.json`](.config/powerline/)
  
  </blockquote>
  
  </details>

  <details>
    <summary>Ranger</summary>
    
  <blockquote>
    
  Files:
  - [`~/.config/ranger/scope.sh`](.config/ranger/scope.sh)
  - [`~/.config/ranger/rc.conf`](.config/ranger/rc.conf)

  [ranger](https://github.com/ranger/ranger) is a TUI file manager. We enable file previews using iterm2 and video previews using ffmpegthumbnailer. We also enable svg previews.
  
  </blockquote>
  
  </details>

</details>

<details>
  <summary>.cron</summary>
  
   <blockquote>
  local cron jobs for alarms and updates
    </blockquote>
    
</details>

<details>
  <summary>.local/bin</summary>
  
  <blockquote>
  This is just where we throw a few really simple scripts like:
  imgcat, and it2setkeylabel for iterm2 to cat images in the terminal and use the touchbar on macOS with iterm2.
  there's also a `utc` command there, for ease of use printing the time in UTC.
 
  </blockquote>
    
</details>

<details>
  <summary>.vim*</summary>
  
   <blockquote>
 
  Configuration for [vim](https://www.vim.org/), a text editor, and it's plugins, installed via vim-plug.

  [`~/.vimrc`](.vimrc) is the main file for the global vim configuration. We set a
  lot of defaults, including:
  - setting window width to 82 characters
  - enabling line numbers
  - enabling highlighting of column cursor is on
  - add a colored column on column 80 for tidy python
  - sets a nerd font for vim
  - enable syntax highlighting
  - use space_chalk colorscheme
  - configure icons for VimDevicons, and NERDTree
  - ale icons changed, ale linters and fixers set for python
  - gitgutter icons
  - folding defaults
  - sets backups
  - allow backspace in insert mode
  - default tabbing
  - set search history
  - installs all the plugins [here](https://github.com/jessebot/dot_files/blob/main/.vimrc#L452)
  - uses template files below

  Auto-install vim-plug:
  - [`~/.vim/autoload/plug.vim`](.vim/autoload/plug.vim)

  Files for syntax highlighting for python, ssh_known_hosts, and toml files:
  - [`~/.vim/syntax/python.vim`](.vim/syntax/python.vim)
  - [`~/.vim/syntax/ssh_known_hosts.vim`](.vim/syntax/ssh_known_hosts.vim)
  - [`~/.vim/syntax/toml.vim`](.vim/syntax/toml.vim)

  Files for default values in a python or markdown file:
  - [`~/.vim/templates/template.md`](.vim/templates/template.md)
  - [`~/.vim/templates/template.py`](.vim/templates/template.py)

</blockquote>

</details>

<details>
  <summary>.bash_profile, .bashrc, .bashrc_k8s</summary>
  
   <blockquote>
   
  Configuration for BASH. The `.bash_profile` just sources the `.bashrc`, since macOS default looks for bash_profile instead of bashrc.

  The `.bashrc` sets the following defaults:
  - turns off bells
  - sets vim as your text editor
  - enables 256 colors
  - fix how less handles non-text input files
  - change the default colors for less used in man pages
  - set history sizes
  - set pathing for go and python
  - enable tab completion
  - aliases away MANY typos
  - aliases a bunch of shorter commands to longer commands
  - changes default pagers used when file is too long for catting
  - runs neofetch when you source it
  - sources any other files called `.bashrc*`

  The `.bashrc_k8s` is for kubernetes defaults:
  - helpful sensible aliases such as: `kg` for `kubectl get`
  - set pathing for `krew`, a plugin manager for `kubectl`.
  
  </blockquote>

</details>

<details>
  <summary>.gitignore</summary>
  
   <blockquote>
  Git ignore file for all sorts of things in a home directory that should never get committed.
    </blockquote>

</details>

<details>
  <summary>.hyper.js</summary>
  
   <blockquote>
  Sensible defaults for the hyper terminal emulator.
    </blockquote>

</details>

<details>
  <summary>.iterm2_shell_integration.bash</summary>
  
   <blockquote>
  This is for installing the iterm2 shell integration for macOS.
    </blockquote>

</details>

<details>
  <summary>.tmux.conf</summary>
  
   <blockquote>
  Sets 256 colors for tmux and enables the powerline tmux status line.
    </blockquote>

</details>

<details>
  <summary>.zshrc</summary>
  
  <blockquote>
  a .zshrc a friend wrote for me once, and I never removed :)
  Who knows what lives there. :shrug:
  
  </blockquote>

</details>

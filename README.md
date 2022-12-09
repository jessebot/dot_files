# Dot Files for `onboardme`

These started as my personal dot files, but then they became the sensible defaults for
[`onboardme`](https://github.com/jessebot/onboardme), which started out as a script
to manage my dot files. Funny how these things work. :shrug:

These directories/files are installed to your home directory.

### Sections for each config directory/file

<details>
  <summary><code>.config</code></summary>

  <blockquote>

  <details>
    <summary><code>asciinema</code></summary>

  <blockquote>

  File: [`~/.config/asciinema/config`](.config/asciinema/config)

  Config file for [`asciinema`][asciinema], a lightweight, purely text-based
  approach to terminal recording. Currently it just sets the shell command to
  be `/bin/bash --login`, which loads your bash variables. This could be changed
  to a different shell and their equivilent.

  </blockquote>

  </details>

  <details>
    <summary><code>bat</code></summary>

  <blockquote>

  File: [`~/.config/bat/config`](.config/bat/config)

  Config file for `bat`[bat], a `cat` replacement with sytax highlighting and
  git support. Currently the config file:
  - sets a default theme
  - enable italic text
  - maps Chart.lock files to YAML syntax (this is for the helm charts for k8s)

  The goal is to have a spacechalk-like theme soon :)

  </blockquote>

  </details>

  <details>
    <summary><code>gh</code></summary>

  <blockquote>

  File: [`~/.config/gh/config.yml`](.config/gh/config.yml)

  Config file for [`gh`][github-cli], the GitHub CLI. There's not a ton in there,
  but it uses [rich-cli] as a prettier pager, and firefox as a browser,
  and setting [vim] as an editor. The rest is stock, and subject to change.

  </blockquote>

  </details>

  <details>
    <summary><code>glab-cli</code></summary>

  <blockquote>

  File: [`~/.config/glab-cli/config.yml`](.config/glab-cli/config.yml)

  Config file for [`glab`](https://glab-cli.io/), an open source GitLab CLI tool.
  There's not a ton in there, but it uses a dark theme, firefox as a browser,
  and [vim] as an editor. The rest is stock, and subject to change.

  </blockquote>

  </details>

  <details>
    <summary><code>iterm2</code></summary>

  <blockquote>

  Symlinked File:  [`~/Library/Application\ Support/iTerm2/DynamicProfiles/Profiles.json`](Library/Application\ Support/iTerm2/DynamicProfiles/Profiles.json)

  [iterm2] default profile with spacechalk colorscheme,
  and then a minimal profile with basically nothing special and a plain `.bash_profile`.

  </blockquote>

  </details>

  <details>
    <summary><code>karabiner</code></summary>

  <blockquote>

  File: [`~/.config/karabiner/karabiner.json`](.config/karabiner/karabiner.json)

  Config file for [karabiner](https://karabiner-elements.pqrs.org/),
  which is used to map capslock to control on macOS and other key remapping that
  can be really useful.

  </blockquote>

  </details>

  <details>
    <summary><code>kitty</code></summary>

  <blockquote>

  Files:
  - [`~/.config/kitty/kitty.conf`](.config/kitty/kitty.conf)
  - [`~/.config/kitty/kitty-dark.png`](.config/kitty/kitty-dark.png)

  Config files related to [kitty], a terminal emulator. Cute open source
  kitty icon image by [DinkDonk], as well as a basic `kitty.conf` to
  use some [nerdfonts], and set up look and feel on macOS.

  </blockquote>

  </details>

  <details>
    <summary><code>lsd</code></summary>

  <blockquote>

  File: [`~/.config/lsd/config.yaml`](.config/lsd/config.yaml)

  Config file for [`lsd`][lsd], an [`ls`][ls] alternative with icons and
  pretty colors. There's an intension to write and release a
  [spacechalk] theme for lsd eventually.

  </blockquote>

  </details>

  <details>
    <summary><code>lsimg</code></summary>

  <blockquote>

  File: [`~/.config/lsimg/config.yaml`](.config/lsimg/config.yaml)

  This is a local project that I'm working on to rewrite a bash script in python,
  to do basic checking of images in the terminal. I might remove it though,
  because after discovering [ranger], it might not be really needed :shrug:

  </blockquote>

  </details>

  <details>
    <summary><code>neofetch</code></summary>

  <blockquote>

  File: [`~/.config/neofetch/config.conf`](.config/neofetch/config.conf)

  Config file for [neofetch], a command-line system information tool
  written in bash 3.2+. The intension is to pair down information to only
  what's needed, and maybe have a cute image :)

  </blockquote>

  </details>

  <details>
    <summary><code>neomutt</code></summary>

  <blockquote>

  Files:
  - [`~/.config/neomutt/mailcap`](.config/neomutt/mailcap)
  - [`~/.config/neomutt/neomuttrc`](.config/neomutt/neomuttrc)
  - [`~/.config/neomutt/themes/spacechalk/neomutt_spacechalk_colors.muttrc`](.config/neomutt/themes/spacechalk/neomutt_spacechalk_colors.muttrc)
  - [`~/.config/neomutt/themes/spacechalk/powerline.neomuttrc`](.config/neomutt/themes/spacechalk/powerline.neomuttrc)

  Config files for [NeoMutt], a terminal based email client. Config includes:
  - sets spacechalk theme, based on the [neonwolf colorscheme] and [neomutt powerline]
  - sets character set to be utf-8 (emojis 🧑‍💻)
  - sets basic IMAP and SMTP settings
  - sets tls by default
  - sets header_cache and message_cachedir to be `~/.cache/mutt` (must be a directory, NOT a file)
  - sets navigation keys similar to vim
  - set a key binding for `V` to be opening html attachments
  - removes the prompt of hitting enter after viewing an attachment

  You'll still need to create `~/.config/neomutt/keys` with the following info:

  ```ini
  set my_user=you@youremail.com
  set my_name="Your Name"

  # if you're using protonmail this is the password from protonmail-bridge,
  # after you login, not your actual email password
  set my_pass="areallycoolpasswordfordogs"
  ```

  Config file for [NeoMutt's MIME Support], which is how [NeoMutt], a [TUI]
  email client, handles attachments e.g. html in an email body, PDFs, images...

  We currently open these applications for these file types:

  | file type | application   |
  |:---------:|---------------|
  |    html   | [w3m]         |
  |    PDFs   | macOS preview |
  |   images  | img2[sixel]   |

  </blockquote>

  </details>

  <details>
    <summary><code>nvim</code></summary>

  <blockquote>

  Config files for [neovim] is a hyperextensible Vim-based text editor,
  which is in some ways a sucessor to [vim]. It's a lot faster, for one,
  and there's more support for more languages, which means more plugins.
  Uses [packer] to manager neovim plugins.

  Each file explained below:

  ### [`init.lua`](.config/nvim/init.lua)
  The main global configuration changes are:
  - turning off mouse scrolling
  - enabling line numbers
  - adding a cursorline
  - setting column 80 to be a different color for tidy code
  - enabling gui colors so you aren't limited to like 8 colors
  - uses the [spacechalk] colorscheme
  - sources all the files in [~/.config/nvim/lua](.config/nvim/lua),
    including [packer], plugins, and local plugin configs.

  ### [`~/.config/nvim/packerinit.vim`](.config/nvim/packerinit.vim)
  This is a quick and dirty lua function to print " ♥ ♥ ♥ " if neovim is running
  in an interactive session and packer completes an action, and to exit if we're
  running headless, meaning we're running in a script.

  ### [`~/.config/nvim/lua/plugins.lua`](.config/nvim/lua/plugins.lua)
  This is the configuration for packer, our plugin manager for neovim. It
  installs packer, and then all of our plugins. You can check out all the
  plugins that are installed, or called from vim plugins starting on line 15.

  ### [`~/.config/nvim/lua/user/airline.lua`](.config/nvim/lua/user/airline.lua)
  sets defaults for [airline][airline], a status line for
  vim and neovim. The configurations are:
  - use [spacechalk] theme
  - enables [powerline fonts][powerline fonts] (fun icons)
  - disables empty sections of the status line
  - enables the [ale] extension to work with airline for linting
  - changes the default dividers to be   and '
  - sets a line number percentage function for a slimmer ln segment

  ### [`~/.config/nvim/lua/user/ale.lua`](.config/nvim/lua/user/ale.lua)
  sets defaults for [ale][ale] such as:
  - enable ale by default
  - error icons are now  and warn icons are now 
  - don't lint on text changes, only on mode changes
  - use lints for python such as ruff and flake8
  - run autofixers on save
  - move between errors

  ### [`~/.config/nvim/lua/user/dashboard.lua`](.config/nvim/lua/user/dashboard.lua)
  config for a starting screen [dashboard] for neovim. You
  should just check out the file to see what's being done. It's cute ascii art,
  and utilizes [telescope] to check out your files and previously
  opened files.

  ### [`~/.config/nvim/lua/user/folding.lua`](.config/nvim/lua/user/folding.lua)
  config file to enable folding, which is just vim speak for collapsing
  blocks of code. Sets some defaults.

  ### [`~/.config/nvim/lua/user/nvim-tree.lua`](.config/nvim/lua/user/nvim-tree.lua)
  config file for [nvim-tree], a neovim file explorer written in lua, with icons.

  Opens on opening of any file, and auto-adjusts its window size.

  ### [`~/.config/nvim/lua/user/tree-sitter.lua`](.config/nvim/lua/user/tree-sitter.lua)
  config file for the nvim [tree-sitter] plugin, which helps with syntax highlighting of various languages.

  currently installing syntax for: "lua", "yaml", "bash", "hcl"

  </blockquote>

  </details>

  <details>
    <summary><code>Powerline</code></summary>

  <blockquote>

  Configuration files for [powerline], a status line for [BASH] and [tmux]. We enable a [spacechalk] color theme as well as:
  - local IP address
  - hostname
  - current working directory
  - git status info
  - kubernetes info
  - laptop battery information
  - the time
  - status of last run command (only appears if exit code is not 0)

  Currently working on getting mail notifications working.

  Files for colors:
  - [`~/.config/powerline/colors.json`](.config/powerline/colors.json)
  - [`~/.config/powerline/colorschemes/default.json`](.config/powerline/colorschemes/default.json)
  - [`~/.config/powerline/colorschemes/shell/default.json`](.config/powerline/colorschemes/shell/default.json)

  Files for configuring powerline for a login shell, and the console shell:
  - [`~/.config/powerline/themes/shell/default.json`](.config/powerline/themes/shell/default.json)
  - [`~/.config/powerline/themes/powerline.json`](.config/powerline/themes/powerline.json)
  - [`~/.config/powerline/themes/powerline_terminus.json`](.config/powerline/themes/powerline_terminus.json)
  - [`~/.config/powerline/themes/unicode_terminus.json`](.config/powerline/themes/unicode_terminus.json)

  File for configuring [tmux] status line:
  - [`~/.config/powerline/themes/tmux/default.json`](.config/powerline/)

  </blockquote>

  </details>

  <details>
    <summary><code>Ranger</code></summary>

  <blockquote>

  Files:
  - [`~/.config/ranger/scope.sh`](.config/ranger/scope.sh)
  - [`~/.config/ranger/rc.conf`](.config/ranger/rc.conf)

  [ranger][ranger] is a [TUI] file manager. Current configurations:
  - enable file previews using [iterm2]
  - enable video previews using ffmpegthumbnailer
  - enable svg previews.

  </blockquote>

  </details>

  <details>
    <summary><code>terminator</code></summary>

  <blockquote>

  File: [`~/.config/terminator`](.config/terminator)

  Default config for my favorite terminal from my starting days in tech, [terminator].
  We set some basic [spacechalk]-esk colors, transparency, and mononoki fonts.

  </blockquote>

  </details>

</details>

<details>
  <summary><code>.cron</code></summary>

   <blockquote>
  local cron jobs for alarms, and package manager updates
    </blockquote>

</details>

<details>
  <summary><code>.local/bin</code></summary>

  <blockquote>

  Files:
  - [`~/.local/bin/utc`](.local/bin/utc)
  - [`~/.local/bin/splits`](.local/bin/splits)
  - [`~/.local/bin/w3msplits`](.local/bin/w3m-splits)

  This is just where we throw a few really simple scripts like:

  | Command         | Description                                                 |
  |-----------------|-------------------------------------------------------------|
  | `utc`           | for ease of use printing the time in UTC                    |
  | `iterm2-splits` | open split in iterm2 and send a command to it               |
  | `w3m-splits`    | open split in iterm2 and send a website or HTML file to w3m |

  `w3m-splits` is mostly useful for [NeoMutt], but anything is possible :shrug:

  </blockquote>

</details>

<details>
  <summary><code>.vim*</code></summary>

   <blockquote>

  Configuration for [vim], a text editor, and it's plugins, installed via
  [vim-plug].

  [`~/.vimrc`](.vimrc) is the main file for the global vim configuration.
  We set a lot of defaults, including:
  - setting window width to 82 characters
  - enabling line numbers
  - enabling highlighting of column cursor is on
  - add a colored column on column 80 for tidy python
  - sets a nerd font for vim
  - enable syntax highlighting
  - use [spacechalk] colorscheme
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

  Files for syntax highlighting for python, ssh_known_hosts, and .toml files:
  - [`~/.vim/syntax/python.vim`](.vim/syntax/python.vim)
  - [`~/.vim/syntax/ssh_known_hosts.vim`](.vim/syntax/ssh_known_hosts.vim)
  - [`~/.vim/syntax/toml.vim`](.vim/syntax/toml.vim)

  Files for default values in a python or markdown file:
  - [`~/.vim/templates/template.md`](.vim/templates/template.md)
  - [`~/.vim/templates/template.py`](.vim/templates/template.py)

</blockquote>

</details>

<details>
  <summary><code>.w3m</code></summary>

  <blockquote>
  Files:
  - [`~/.w3m/keymap`](.w3m/keymap)
  - [`~/.w3m/config`](.w3m/config)

  Files for the [w3m] terminal based web browser. This config sets:
  - set default mailcap for MIME types
  - always display images
  - quit without asking if we hit `qq`
  - use vim like key bindings

  </blockquote>

</details>

<details>
  <summary><code>.bash_profile, .bashrc, .bashrc_k8s</code></summary>

   <blockquote>

  Configuration files for [BASH].
  The `.bash_profile` just sources the `.bashrc`, since macOS default looks for
  `.bash_profile` instead of `.bashrc`.

  The `.bashrc` sets the following defaults:
  - turns off bells
  - sets [vim] as your text editor
  - enables 256 colors
  - fix how less handles non-text input files
  - change the default colors for less used in man pages
  - set history sizes
  - set pathing for golang and python
  - enable tab completion
  - aliases away MANY typos
  - aliases a bunch of shorter commands to longer commands
  - changes default pagers used when file is too long for catting
  - runs [neofetch] when you source it
  - sources any other files called `.bashrc*`

  The `.bashrc_k8s` is for kubernetes defaults:
  - set pathing for [`krew`][krew], a plugin manager for [`kubectl`][kubectl].
  - helpful sensible aliases such as: `kg` for `kubectl get`

  </blockquote>

</details>

<details>
  <summary><code>.gitconfig</code></summary>

  <blockquote>

  Default git config file. We set the following parameters:
  - Default branch for new repos is `main`
  - Push up to remote automatically if it's a new branch
  - color is always on
  - set specific terminal colors for:
    - `git branch`
    - `git status`
    - `git diff`

  We also include this block, which allows you to have a personal gitconfig file:

  ```toml
  [includeIf "gitdit:~/"]
      path = .gitconfig-personal
  ```

  You can create a `~/.gitconfig-personal` file and store info such as:

  ```toml
  [user]
      email = fido@coolemailproviderfordogs.com
      name = Fido Gooddog
  ```

  </blockquote>

</details>

<details>
  <summary><code>.gitignore</code></summary>

  <blockquote>

  Git ignore file for all sorts of things in your home directory that should
  never get committed if this repo is used as your home directory dot files.

  </blockquote>

</details>

<details>
  <summary><code>.hyper.js</code></summary>

  <blockquote>

  Sensible defaults for the [hyper](https://hyper.is) terminal emulator.

  </blockquote>

</details>

<details>
  <summary><code>.iterm2_shell_integration.bash</code></summary>

   <blockquote>

  This is for installing the [iterm2] shell integration for macOS.

   </blockquote>

</details>

<details>
  <summary><code>.tmux.conf</code></summary>

<blockquote>

Config file for [tmux]. Currently, it will:
- Sets 256 colors
- enable the [powerline] tmux status line

</blockquote>

</details>

<details>
  <summary><code>.zshrc</code></summary>

  <blockquote>

  Config files for zsh that a friend wrote for me once, and I never removed :)
  Who knows what lives there. :shrug:

  </blockquote>

</details>


<!-- ♡  ♡  ♡  ♡  ♡  ♡  ♡  ♡  ♡  Link References ♡  ♡  ♡  ♡  ♡  ♡  ♡  ♡  ♡ -->

<!-- general -->
[asciinema]: https://asciinema.org/ "asciinema"
[bat]: https://github.com/sharkdp/bat#configuration-file "bat - cat with wings"
[BASH]: https://en.wikipedia.org/wiki/Brian_Fox_(computer_programmer) "BASH"
[github-cli]: https://cli.github.com/ "github cli"
[neofetch]: https://github.com/dylanaraps/neofetch "neofetch"
[powerline]: https://github.com/powerline/powerline "powerline"
[rich-cli]: https://github.com/Textualize/rich-cli "rich cli"
[sixel]: https://en.wikipedia.org/wiki/Sixel "sixel"
[tmux]: https://github.com/tmux/tmux "tmux"
[w3m]: https://w3m.org "w3m"
[TUI]: https://en.wikipedia.org/wiki/Text-based_user_interface "TUI"

<!-- ------------------------ Fonts and Colors -------------------------- -->
[nerdfonts]: https://www.nerdfonts.com/ "nerdfonts"
[powerline fonts]: https://github.com/powerline/fonts "powerline fonts"
[spacechalk]: https://github.com/jessebot/spacechalk "spacechalk colorscheme"

<!-- ------------------------------- Kubernetes --------------------------- -->
[krew]: https://krew.sigs.k8s.io/ "krew, plugin manager for kubectl"
[kubectl]: https://kubernetes.io/docs/reference/kubectl/kubectl/ "cli for kubernetes"

<!-- ---------------------- Terminal emulators ---------------------- -->
[iterm2]: https://iterm2.com/ "iterm2"
[kitty]: https://sw.kovidgoyal.net/kitty/ "kitty, a terminal emulator"
[DinkDonk]: https://github.com/DinkDonk/kitty-icon "kitty-icon"

<!-- ---------------------- File browsers/listers ---------------------- -->
[ls]: https://linux.die.net/man/1/ls "gnu tool: ls"
[lsd]: https://github.com/Peltoche/lsd "lsd, ls alternative"
[ranger]: https://github.com/ranger/ranger "ranger file manager"

<!-- ---------------------------- Email -------------------------------- -->
[NeoMutt's MIME Support]: https://neomutt.org/guide/mimesupport "neomutt MIME support"
[NeoMutt]: https://neomutt.org "neomutt"
[neonwolf colorscheme]: https://gitlab.com/h3xx/mutt-colors-neonwolf "neonwolf neomutt colorscheme"
[neomutt powerline]: https://github.com/sheoak/neomutt-powerline-nerdfonts "neomutt-powerline-nerdfonts"

<!-- ------------------------- Vim and Neovim ---------------------------- -->
[airline]: https://github.com/vim-airline/vim-airline "airline"
[ale]: https://github.com/dense-analysis/ale "ale: asynchonous linting engine"
[dashboard]: https://github.com/glepnir/dashboard-nvim "dashboard.nvim"
[packer]: https://github.com/wbthomason/packer.nvim "neovim packer"
[neovim]: https://neovim.io/ "neovim, vim based text editor"
[nvim-tree]: https://github.com/nvim-tree/ "nvim-tree"
[telescope]: https://github.com/nvim-telescope/telescope.nvim "telescope.nvim"
[tree-sitter]: https://github.com/nvim-treesitter/nvim-treesitter "nvim-treesitter"
[vim]: https://www.vim.org/ "vim, a text editor"
[vim-plug]: https://github.com/junegunn/vim-plug "plugin manager for vim"

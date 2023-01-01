# Dot Files for `onboardme`

These started as my personal dot files, but then they became the sensible defaults for
[`onboardme`](https://github.com/jessebot/onboardme), which started out as a script
to manage my dot files. Funny how these things work. :shrug:

These directories/files are installed to your home directory and follow the [XDG Base Directory Spec] as closely as possible.

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
    <summary><code>bash</code></summary>

  <blockquote>

  Files
  - [`~/.config/bash/alias.sh`](.config/bash/alias.sh)
  - [`~/.config/bash/completion.sh`](.config/bash/completion.sh)
  - [`~/.config/bash/history.sh`](.config/bash/history.sh)
  - [`~/.config/bash/iterm2_shell_integration.sh`](.config/bash/iterm2_shell_integration.sh)
  - [`~/.config/bash/k8s.sh`](.config/bash/k8s.sh)
  - [`~/.config/bash/path.sh`](.config/bash/path.sh)
  - [`~/.config/bash/minimal.sh`](.config/bash/minimal.sh)
  - [`~/.config/bash/text_editing.sh`](.config/bash/text_editing.sh)

  #### [`~/.config/bash/alias.sh`](.config/bash/alias.sh)
  a config file to organize all our BASH aliases

  #### [`~/.config/bash/completion.sh`](.config/bash/completion.sh)
  enable tab completion

  #### [`~/.config/bash/history.sh`](.config/bash/history.sh)
  - sets history to be in `~/.local/state/bash/history`
  - sets default history size
  - don't log duplicate history lines

  #### [`iterm2_shell_integration.sh`](.config/bash/iterm2_shell_integration.sh)
  sets up [iterm2] shell stuff

  #### [`~/.config/bash/text_editing.sh`](.config/bash/text_editing.sh)
  sets either [neovim] or [vim] as your text editor

  #### [`~/.config/bash/k8s.sh`](.config/bash/k8s.sh)
  kubernetes defaults:
  - set pathing for [`krew`][krew], a plugin manager for [`kubectl`][kubectl].
  - helpful sensible aliases such as: `kg` for `kubectl get`

  #### [`~/.config/bash/path.sh`](.config/bash/path.sh)
  - set [XDG Base Directory Spec]
  - set pathing for golang and python
  - set pathing for home brew

  #### [`~/.config/bash/text_editing.sh`](.config/bash/text_editing.sh)
  - fix how less handles non-text input files
  - change the default colors for less used in man pages
  - changes default pagers used when file is too long for catting

  </blockquote>

  </details>

  <details>
    <summary><code>fastfetch</code></summary>

  <blockquote>

  File: [`~/.config/fastfetch/config.conf`](.config/fastfetch/config.conf)

  Config file for [fastfetch], is a neofetch-like tool for fetching system information and displaying them in a pretty way. It is written in pure c, with performance and customizability in mind. Currently, Linux, Android, FreeBSD, MacOS and Windows 7+ are supported.

  Our current configuration default prints a dog on a computer using the iterm2
  image protocol, but you could also change that to be sixel if you wanted.

  We also provide a couple of basic presets in this dir:
  `$XDG_DATA_HOME/.local/share/fastfetch/presets`

  You can also change the configuration to show more data or less on the right
  side.

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
    <summary><code>git</code></summary>

  <blockquote>

  File: [`~/.config/git/config`](.config/git/config)

  Default git config file. We set the following parameters:
  - Default branch for new repos is `main`
  - Push up to remote automatically if it's a new branch
  - color is always on
  - set specific terminal colors for:
    - `git branch`
    - `git status`
    - `git diff`

  We also include this block, which allows you to have a personal gitconfig file:

  ```gitconfig
  [includeIf "gitdit:~/"]
      path = ~/.config/git/personal
  ```

  You can create a `~/.config/git/personal` file and store info such as:

  ```gitconfig
  [user]
      email = fido@coolemailproviderfordogs.com
      name = Fido Good-dog
      signingkey = gooddoggpgsigningkey
  [commit]
      gpgsign = true
  ```

  </blockquote>

  </details>

  <details>
  <summary><code>hyper</code></summary>

  <blockquote>

  File: [`~/.config/hyper/.hyper.js`](.config/hyper/.hyper.js)

  Sensible defaults for the [hyper](https://hyper.is) terminal emulator.

  </blockquote>

  </details>

  <details>
    <summary><code>iterm2</code></summary>

  <blockquote>

  [iterm2] is a terminal emulator for macOS.

  Symlinked File:  [`~/.config/iterm2/Profiles.json -> ~/Library/Application\ Support/iTerm2/DynamicProfiles/Profiles.json`](Library/Application\ Support/iTerm2/DynamicProfiles/Profiles.json)

  ### Profiles.json
  Sets some basic profiles:
  - default - profile with spacechalk colorscheme,
  - minimal - profile with basically nothing special and a plain `.bash_profile`.

  ###

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
  - sets basic SMTP settings (but use [offlineimap] to pull the imap backup)
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
    <summary><code>offlineimap</code></summary>

  <blockquote>

  File: [`~/.config/offlineimap/config`](.config/offlineimap/config)

  This is to sync your email from whereever, but it's default configured for
  protonmail right now :) You will need to export the following env variables:

  (if using protonmail bridge, these should be the credentials from there)

  - `MAIL_SERVER` - normally 127.0.0.1 for protonmail
  - `MAIL_USER` - normally youruser@protonmail.com for protonmail
  - `MAIL_PASS` - normally generated from the protonmail bridge app
  - `MAIL_PORT` - typically 1143 for protonmail

  Currently we import ALL folders except the "All Mail" folder, which is just
  all the mail from all the other folders (including inbox, sent, trash, etc)

  </blockquote>

  </details>

  <details>
    <summary><code>powerline</code></summary>

  <blockquote>

  Configuration files for [powerline], a status line for [BASH] and [tmux]. We enable a [spacechalk] color theme as well as:
  - local IP address
  - hostname
  - current working directory
  - git status info
  - unread mail count
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
    <summary><code>python</code></summary>

  <blockquote>

  File:
  - [`~/.config/python/interactive_startup.py`](.config/python/interactive_startup.py)

  This file sets the default history location to `$XDG_STATE_HOME` (`~/.local/state/python/history`)
  It requires the following in your bash config:

  ```bash
  export PYTHONSTARTUP=$XDG_CONFIG_HOME/python/interactive_startup.py
  ```

  </blockquote>

  </details>

  <details>
    <summary><code>ranger</code></summary>

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
    <summary><code>spotifyd</code></summary>

  <blockquote>

  Files:
  - [`~/.config/spotifyd/spotifyd.conf`](.config/spotifyd/spotifyd.conf)

  [spotifyd] is a spotify daemon used in combination with [spotify-tui] or
  other alternative spotify frontends.

  Current settings are for Linux only. I will add a macOS file and appropriate
  aliases and docs soon :)

  For Linux, this still requires a premium account, but then you can follow
  these instructions to set up your spotify api:
  https://github.com/Rigellute/spotify-tui#connecting-to-spotifys-api

  (You also need to change your cache in spotifyd.conf to be your username)

  After that, just make sure you have your spotify credentials in bitwarden,
  and that you are logged into bitwarden via the [bw] cli. DON'T FORGET TO
  EXPORT YOUR SESSION ID! Then you HAVE TO RESTART SPOTIFYD!

  ```bash
  brew services restart spotifyd
  ```

  **Linux Note:** If you did a `brew install spotifyd`, then you might have to
  `brew edit spotifyd`, and then fix the hardcoded macOS backend to be `alsa`.
  Then you need to do a `brew reinstall --build-from-source spotifyd`.

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


  <details>
    <summary><code>tmux</code></summary>

  <blockquote>

  File: [`~/.config/tmux/tmux.conf`](.config/tmux/tmux.conf)

  Config file for [tmux]. Currently, it will:
  - Sets 256 colors
  - enable the [powerline] tmux status line

  </blockquote>

  </details>

  <details>
    <summary><code>vim</code></summary>

  <blockquote>

  Configuration for [vim], a text editor, and it's plugins, installed via
  [vim-plug].

  [`~/.vimrc`](.vimrc) is the main file for the global vim configuration.
  We set a lot of defaults, including:
  - making vim use the [XDG Base Directory Spec]
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
  - [`~/.w3m/config`](.w3m/config)
  - [`~/.w3m/keymap`](.w3m/keymap)
  - [`~/.w3m/mailcap`](.w3m/mailcap)

  Files for the [w3m] terminal based web browser.

  [`~/.w3m/config`](.w3m/config) sets:
  - set default mailcap file for MIME types
  - always display images
  - set the default keymap file (for mapping keys)
  - quit without asking

  [`~/.w3m/keymap`](.w3m/keymap) sets vim key bindings.

  [`~/.w3m/mailcap`](.w3m/mailcap) is supposed to set default MIMEtypes for w3m but does not :shrug:

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
  <summary><code>.local</code></summary>

  <blockquote>

  Directories:

  <details>
    <summary><code>bin</code></summary>

  <blockquote>

  Files:
  - [`~/.local/bin/utc`](.local/bin/utc)
  - [`~/.local/bin/w3msplits`](.local/bin/w3m-splits)

  This is just where we throw a few really simple scripts like:

  | Command         | Description                                                 |
  |-----------------|-------------------------------------------------------------|
  | `utc`           | for ease of use printing the time in UTC                    |
  | `w3m-splits`    | open split in iterm2 and send a website or HTML file to w3m |

  `w3m-splits` is mostly useful for [NeoMutt], but anything is possible :shrug:

  Directories:

  <details>
    <summary><code>iterm2</code></summary>

  <blockquote>

  Directory:
  - [`~/.local/bin/iterm2`](.local/bin/iterm2)

  Everything in there are files written and provided by iTerm2 for integrating iterm2 magic into your terminal. The only custom one is the following:

  | Command         | Description                                    |
  |:---------------:|:-----------------------------------------------|
  | `it2split`      | Open split in iterm2 with your default profile |

  </blockquote>

  </details>

  </blockquote>

  </details>

  <details>
    <summary><code>share</code></summary>

  <blockquote>

  Mostly READMEs to generate directory structure, but also some fastfetch preset configs.

  </blockquote>

  </details>

  <details>
    <summary><code>state</code></summary>

  <blockquote>

  This directory and the director[y/ies]/file(s) within it are specifically to auto-generate directory structure so that XDG spec is enforced with tools that only loosely enforce it.

  </blockquote>

  </details>

</details>

<details>
  <summary><code>.bash_profile, .bashrc</code></summary>

   <blockquote>

  Configuration files for [BASH].
  The `.bash_profile` just sources the `.bashrc`, since macOS default looks for
  `.bash_profile` instead of `.bashrc`.

  The `.bashrc` sets the following defaults:

  - turns off bells
  - enables 256 colors
  - sources all the files in `~/.config/bash` (see above under config > bash )
  - sources personal file in `~/.config/bash/personal/bashrc`
  - runs [neofetch] when you source it

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
  <summary><code>.hushlogin</code></summary>

  <blockquote>

  This just silences the last login message of shells.

  </blockquote>

</details>

<details>
  <summary><code>.zshrc</code></summary>

  <blockquote>

  Recently started giving this some TLC, but still in it's infancy to be match the .bash configs. Currently we:
  - set some useful aliases
  - set the same powerline prompt as bash

  </blockquote>

</details>


Please feel free to fork this repo and make it your own.
You can still use `onboardme`, but you'll want to pass in _your_ git URL and branch. Example:

```bash
# this uses your personal git URL and makes sure to always pull from main
# if you want to overwrite your existing dot files, you can also add --overwrite to this command
onboardme --git_url https://github.com/your_username/dot_files --git_branch main
```

### RoadMap

- Get screenshots
- Sort out neovim idiosyncrasies to start using neovim full time
- migrate some of the themeing to a spacechalk org to unify it all

* more in the GitHub Issues

<!-- ♡  ♡  ♡  ♡  ♡  ♡  ♡  ♡  ♡  Link References ♡  ♡  ♡  ♡  ♡  ♡  ♡  ♡  ♡ -->

<!-- general -->
[asciinema]: https://asciinema.org/ "asciinema"
[bat]: https://github.com/sharkdp/bat#configuration-file "bat - cat with wings"
[BASH]: https://en.wikipedia.org/wiki/Brian_Fox_(computer_programmer) "BASH"
[bw]: https://bitwarden.com/help/cli "bitwarden CLI"
[github-cli]: https://cli.github.com/ "github cli"
[fastfetch]: https://github.com/LinusDierheimer/fastfetch "fastfetch"
[powerline]: https://github.com/powerline/powerline "powerline"
[rich-cli]: https://github.com/Textualize/rich-cli "rich cli"
[sixel]: https://en.wikipedia.org/wiki/Sixel "sixel"
[spotifyd]: https://github.com/Spotifyd/spotifyd "spotifyd"
[spotifytui]: https://github.com/Rigellute/spotify-tui "spotify-tui"
[tmux]: https://github.com/tmux/tmux "tmux"
[TUI]: https://en.wikipedia.org/wiki/Text-based_user_interface "TUI"
[w3m]: https://w3m.org "w3m"
[XDG Base Directory Spec]: https://wiki.archlinux.org/title/XDG_Base_Directory#User_directories

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

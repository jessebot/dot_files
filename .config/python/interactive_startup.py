#!/usr/bin/env python3
# quick script to make python use XDG spec
import atexit
import os
from pathlib import Path
import readline
from xdg_base_dirs import xdg_state_home, xdg_cache_home, xdg_data_home

# create the XDG_STATE_HOME/python dir if it doesn't exist
# most likely going to be $HOME/.local/state/python
state_dir = Path.joinpath(xdg_state_home(), 'python')
Path(state_dir).mkdir(exist_ok=True)

# create the XDG_CACHE_HOME/python dir if it doesn't exist
# most likely going to be $HOME/.cache/python
cache_dir = Path.joinpath(xdg_cache_home(), 'python')
Path(cache_dir).mkdir(exist_ok=True)

# create the XDG_DATA_HOME/python dir if it doesn't exist
# most likely going to be $HOME/.local/share/python
data_dir = Path.joinpath(xdg_data_home(), 'python')
Path(data_dir).mkdir(exist_ok=True)

# define history file name
history = os.path.join(state_dir, 'history')

try:
    readline.read_history_file(history)
except OSError:
    pass


def write_history():
    try:
        readline.write_history_file(history)
    except OSError:
        pass


atexit.register(write_history)

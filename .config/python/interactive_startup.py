#!/usr/bin/env python3
# quick script to make python use XDG spec
import atexit
import os
from pathlib import Path
import readline
from xdg import xdg_state_home

# define and create the state dir for python if it doesn't exist
# state_dir = os.path.join(xdg_state_home(), 'python')
state_dir = Path.joinpath(xdg_state_home(), 'python')
Path(state_dir).mkdir(exist_ok=True)


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

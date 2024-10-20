# file structure

```
 .
├──  README.md
├── 󰉐 root
└──  user
```

## root (super user) cron jobs

```
 .
├──  README.md
└── 󰉐 root
    ├──  crontab
    └──  daily.sh
```

Anything in `root/daily.sh` gets run by `root` every day.
 - Currently, this just runs `apt-get update/upgrade` as root to avoid sudo passwords.

`root/crontab` is the file that is copied into `/var/at/tabs` on macOS and `/etc/crontab.d/` on Linux.

## User cron jobs

```
 .
└──  user
    ├──  crontab
    ├──  daily.sh
    ├──  go_home.sh
    ├──  lunch.sh
    └──  self_care_time.sh
```

The "user" is the user that ran last ran `onboardme`. All scripts below will run as that user.

`user/lunch.sh` gets run at lunch time (noon) by the user, for reminders.
`user/daily.sh` gets run daily by the user right after lunch reminders.
- Currently, this runs `onboardme` for updating dot files, OS packages (brew, pip3.12, pipx), fonts, and neovim packages.
`user/go_home.sh` gets run at at 17:10 to remind the user to go home.
`user/self_care_time.sh` gets run at at 22:30 to remind the user to do self care tasks.

`user/crontab` is the file that is copied into `/var/at/tabs` on macOS and `/etc/crontab.d/` on Linux.

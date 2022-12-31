#!/usr/bin/env python3.11
"""
named-mailboxes "" "+INBOX"
named-mailboxes "" "+Drafts"
named-mailboxes "" "+Sent"
named-mailboxes "" "+Labels.leveringsupdates"
named-mailboxes "" "+Labels.retourns"
named-mailboxes "" "+Labels.reviews"
named-mailboxes "" "+Labels.saxenburgerdwarsstraat"
named-mailboxes "" "+Labels.stempelkaart"
named-mailboxes "" "+Labels.viewing"
named-mailboxes "" "+All Services"
named-mailboxes "" "+aankopen"
named-mailboxes "" "+aankopen.eten"
named-mailboxes "" "+aankopen.eten.boodschappen"
named-mailboxes "" "+aankopen.eten.thuisBezorgdOfAfhalen"
named-mailboxes "" "+aankopen.general"
named-mailboxes "" "+aankopen.general.winkel specifieke bonnen"
named-mailboxes "" "+behuizing"
named-mailboxes "" "+behuizing.afwijzing"
named-mailboxes "" "+behuizing.huisBaas"
named-mailboxes "" "+importeren"
named-mailboxes "" "+promoties"
named-mailboxes "" "+Archive"
named-mailboxes "" "+Spam"
named-mailboxes "" "+Trash"
"""
from os import path
from xdg import xdg_config_home


# you can change this if you use a different file
MAILBOXES_PATH = path.join(xdg_config_home(), 'neomutt/mailboxes')


def fix_naming(foldername=""):
    """
    translate names of folders from a remote location to local location for
    neomutt to pick up as mailbox names for the sidebar view.
    We take labels and prepend a nerd font to them
    this will kind of fake nesting your folders by adding some lines
    """
    # if the folder has a . in it, it might be nested
    if '.' in foldername:
        name_sections = foldername.split('.')

        # for labels, we change from "Labels.label" to "ﮉ label"
        if "Labels" in name_sections[0]:
            return f"\"ﮉ {name_sections[1]}"

        # Change indenting depending on how many . in the folder name
        if len(name_sections) == 2:
            return "\"└──  " + name_sections[1].title()
        elif len(name_sections) == 3:
            return "\"    └──  " + name_sections[2].title()
    else:
        return foldername.replace("+", " ").title()


def fix_mailboxes_file(mailbox_path=MAILBOXES_PATH):
    """
    """
    updated_lines_list = []

    # open the mailboxes file to fix the naming
    with open(mailbox_path, 'r') as mailbox_file:
        for line in mailbox_file.readlines():
            # we first split on spaces
            sections = line.split()
            # this should be the name of the folder on local disk
            folder = sections[2]

            # sometimes there's a space in the folder name; we catch it here
            if not folder.endswith('"'):
                folder = " ".join(sections[2:])

            folder_description = fix_naming(folder)

            new_line = " ".join([sections[0], folder_description, folder])
            updated_lines_list.append(new_line + "\n")

    with open(mailbox_path, 'w') as mailbox_writing_file:
        for updated_line in updated_lines_list:
            mailbox_writing_file.write(updated_line)

    return True


fix_mailboxes_file()

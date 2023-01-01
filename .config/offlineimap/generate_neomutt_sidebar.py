#!/usr/bin/env python3.11
"""
NAME: generate_neomutt_sidebar.py
DESC: generate a prettier neomutt sidebar
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


def fix_mailboxes_file(mailbox_path=MAILBOXES_PATH,
                       pin_to_top_list=["inbox", "drafts", "sent"],
                       pin_to_bottom_list=["archive", "trash"]):
    """
    Takes list of neomutt named-mailboxes generated in a file with this format:
        named-mailboxes "" "+INBOX"

    Updates the file to have prettier descriptions like:
        named-mailboxes " Inbox" "+INBOX"

    Also adds some tree nesting to nested directories.

    Takes optional variables for pin_to_top_list and pin_to_bottom_list,
    to make sure certian mailboxes are put on the top vs the bottom of the
    sidebar list
    """
    updated_lines_list = []
    end_list = []
    print(pin_to_top_list)

    # open the mailboxes file to fix the naming
    with open(mailbox_path, 'r') as mailbox_file:
        for line in mailbox_file.readlines():
            # we first split on spaces
            sections = line.split()

            # sometimes there's a space in the folder name; we catch it here
            if sections[2].endswith('"'):
                folder = sections[2]
            else:
                folder = " ".join(sections[2:])

            # this fixes the folder description
            folder_description = fix_naming(folder)

            # this is the new updated line for the for file
            new_line = f"{sections[0]} {folder_description} {folder}\n"

            stripped_folder = folder.replace("+", "").replace('"', '').lower()
            print(stripped_folder)
            # make sure this isn't a special folder to be pinned, such as inbox
            if stripped_folder in pin_to_top_list:
                new_index = pin_to_top_list.index(stripped_folder)
                updated_lines_list.insert(new_index, new_line)
                print("Begin: ", stripped_folder)
            # pin to bottom list such as Trash
            elif stripped_folder in pin_to_bottom_list:
                new_index = pin_to_bottom_list.index(stripped_folder)
                end_list.insert(new_index, new_line)
                print("End: ", stripped_folder)
            else:
                updated_lines_list.append(new_line)

    with open(mailbox_path, 'w') as mailbox_writing_file:
        for updated_line in updated_lines_list:
            mailbox_writing_file.write(updated_line)
        for updated_end_line in end_list:
            mailbox_writing_file.write(updated_end_line)

    return True


fix_mailboxes_file()

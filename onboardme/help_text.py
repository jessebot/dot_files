# file for rich printing
import click
from rich.console import Console
from rich.highlighter import RegexHighlighter
from rich.panel import Panel
from rich.table import Table
from rich.text import Text
from rich.theme import Theme


def options_help():
    """
    Help text for all the options/switches for main()
    Returns a dict.
    """
    dot_file_url = '[meta]https://github.com/jessebot/dot_files[/meta]'
    return {
        'log_level':
        'Logging level to use with the script (DEBUG,INFO,WARN,ERROR).'
        ' Default: [meta]WARN[/meta].',

        'log_file':
        'Full path to a file to log to, if set.',

        'quiet':
        "unstable. Don't output to stdout. Logging to file will still work.",

        'steps':
        'unstable. [b]Only[b] run [meta]STEP[/] in the script.\nSteps: '
        'dot_files, packages, vim_setup.\nExample: [switch]-s[/] [meta]'
        'dot_files[/] [switch]-s[/] [meta]packages',

        'git_url':
        f'A git repo URL for your dot files. Default: {dot_file_url}',

        'git_branch':
        'Branch to use for the git repo url. Default: main',

        'overwrite':
        '[b]Overwrites[/b] existing dot files with files from configured '
        '[option]--git_url[/option] repo.',

        'pkg_managers':
        'Specific [meta]PKG_MANAGER[/] to run. Default: [meta]brew[/], [meta]'
        'pip3.10[/meta], & ([i]on linux[/]) [meta]apt, snap, flatpak[/]. '
        'Accepts multiple.\nEx: [switch]-p[/] [meta]brew[/] [switch]-p[/] '
        '[meta]apt',

        'pkg_groups':
        "Package groups to install. Default: 'default'. Accepts multiple.\nEx:"
        " [switch]-g[/] [meta]devops[/] [switch]-g[/switch] [meta]gaming",

        'remote_host':
        'Setup SSH on a random port & add [meta]IP_ADDR[/] to firewall',

        'firewall':
        'Setup iptables (on [i]linux[/] only).'

    }


class RichCommand(click.Command):
    """
    Override Clicks help with a Richer version.

    This is from the Textualize/rich-cli project on github.com:
    https://github.com/Textualize/rich-cli
    """

    def format_help(self, ctx, formatter):

        class OptionHighlighter(RegexHighlighter):
            highlights = [r"(?P<switch>\-\w)",
                          r"(?P<option>\-\-[\w\-]+)",
                          r"(?P<unstable>[b][e][t][a])"]

        highlighter = OptionHighlighter()

        console = Console(theme=Theme({"option": "cornflower_blue",
                                       "switch": "deep_sky_blue1",
                                       "meta": "light_steel_blue",
                                       "unstable": "italic cyan"}),
                          highlighter=highlighter)

        title = "☁️  [cornflower_blue]OnBoard[i]Me[/] 💻\n"
        desc = (
            "[steel_blue]Get your daily driver just the way I like it, from "
            "[b]text[/] [i]formatting[/], and dot files to opensource package "
            "installation, this script\n intends to save you time with setting"
            "up or upgrading your environment.")

        console.print(title + desc, justify="center")

        console.print("\n[b]Usage[/]:  [royal_blue1]onboardme[/] " +
                      "[cornflower_blue][OPTIONS]\n")

        options_table = Table(highlight=True, box=None, show_header=False,
                              row_styles=["", "dim"],
                              padding=(1, 1, 0, 0))

        # this used to be self.get_params(ctx)[1:] and I don't know why
        for param in self.get_params(ctx):

            if len(param.opts) == 2:
                opt1 = highlighter(param.opts[1])
                opt2 = highlighter(param.opts[0])
            else:
                opt2 = highlighter(param.opts[0])
                opt1 = Text("")

            if param.metavar:
                opt2 += Text(f" {param.metavar}",
                             style="meta")

            options = Text(" ".join(reversed(param.opts)))
            help_record = param.get_help_record(ctx)
            if help_record is None:
                help = ""
            else:
                help = Text.from_markup(param.get_help_record(ctx)[-1],
                                        emoji=False)

            if param.metavar:
                options += f" {param.metavar}"

            options_table.add_row(opt1, opt2, highlighter(help))

        url = (" ♥ [link=https://jessebot.github.io/onboardme/]"
               "jessebot.github.io/onboardme[/link]")

        console.print(Panel(options_table,
                            border_style="dim light_steel_blue",
                            title="⌥  Options",
                            title_align="left",
                            subtitle=url,
                            subtitle_align="right"))

        # I use this to print a pretty svg at the end sometimes
        # console.save_svg("docs/onboardme/screenshots/help_text.svg")
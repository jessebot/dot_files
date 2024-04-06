#!/bin/bash -
#==============================================================================#
#                                                                              #
#          FILE: updates.sh                                                    #
#                                                                              #
#         USAGE: ./updates.sh                                                  #
#                                                                              #
#   DESCRIPTION: Run updates for packages managers and various programs.       #
#                Currently Supported programs: tldr, brew                      #
#                                                                              #
#       OPTIONS: ---                                                           #
#  REQUIREMENTS: ---                                                           #
#        AUTHOR: @jessebot                                                     #
#       CREATED: 09/16/2022 12:31:37 PM                                        #
# LAST_MODIFIED: Sat Apr  6 09:08:58 AM CEST 2024                              #
#==============================================================================#

# Treat unset variables as an error
set -o nounset

# update my tldr data (cli tool for cheatsheets)
tldr --update

# updates all packages
onboardme -O

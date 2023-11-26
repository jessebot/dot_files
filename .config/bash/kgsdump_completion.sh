#!/bin/bash
# quick tab completion script for kubernetes secrets in the current directory
# big thanks to this article: https://opensource.com/article/18/3/creating-bash-completion-script

_kgsdump_completions()
{
  COMPREPLY=($(compgen -W "$(kubectl get secrets --no-headers -o custom-columns=Name:.metadata.name)" -- "${COMP_WORDS[1]}"))
}

complete -F _kgsdump_completions kgsdump
complete -F _kgsdump_completions kgs

_kgsdump_completions()
{
  # COMPREPLY=("kubectl get secrets --no-headers -o custom-columns=Name:.metadata.name")
  COMPREPLY=($(compgen -W "$(kubectl get secrets --no-headers -o custom-columns=Name:.metadata.name)" -- "${COMP_WORDS[1]}"))
}

complete -F _kgsdump_completions kgsdump
complete -F _kgsdump_completions kgs

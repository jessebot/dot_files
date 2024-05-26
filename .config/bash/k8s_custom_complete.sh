#!/bin/bash
# quick tab completion script for kubernetes commands in the current namespace
# big thanks to this article: https://opensource.com/article/18/3/creating-bash-completion-script

# kubernetes secrets
_kgsdump_completions()
{
  COMPREPLY=($(compgen -W "$(kubecolor get secrets --no-headers -o custom-columns=Name:.metadata.name)" -- "${COMP_WORDS[1]}"))
}

complete -F _kgsdump_completions kgsdump
complete -F _kgsdump_completions kgs

# kubernetes pods and logs for those pods
_kgpod_completions()
{
  COMPREPLY=($(compgen -W "$(kubecolor get pods --no-headers -o custom-columns=Name:.metadata.name)" -- "${COMP_WORDS[1]}"))
}

complete -F _kgpod_completions kgp
complete -F _kgpod_completions kl
complete -F _kgpod_completions ke
complete -F _kgpod_completions kpf

# kubernetes ingress
_kgi_completions()
{
  COMPREPLY=($(compgen -W "$(kubecolor get ingress --no-headers -o custom-columns=Name:.metadata.name)" -- "${COMP_WORDS[1]}"))
}

complete -F _kgi_completions kgi

# kubernetes
_kgsvc_completions()
{
  COMPREPLY=($(compgen -W "$(kubecolor get service --no-headers -o custom-columns=Name:.metadata.name)" -- "${COMP_WORDS[1]}"))
}

complete -F _kgsvc_completions kgsvc

# kubernetes
_kgcm_completions()
{
  COMPREPLY=($(compgen -W "$(kubecolor get configmap --no-headers -o custom-columns=Name:.metadata.name)" -- "${COMP_WORDS[1]}"))
}

complete -F _kgcm_completions kgcm

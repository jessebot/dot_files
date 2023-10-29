# Jessebot's Kubernetes helpful exports and aliases for BASH

# Make kubeconfig XDG base directory spec compliant
export KUBECONFIG=$XDG_CONFIG_HOME/kube/config

# this is for the kubernetes plugin manager, krew
export KREW_ROOT=$XDG_DATA_HOME/krew
export PATH="${PATH}:$XDG_DATA_HOME/krew/bin"

# change this to what ever search tool you'd like,
# e.g. "grep -i"
export SEARCH_TOOL="ag"

# I always forget that krew isn't a command
alias krew='kubectl krew'

# cluster context shortcut
alias k="kubecolor"
alias ka="kubecolor apply -f"
alias kc="kubecolor config use-context"
alias kd="kubecolor describe"
alias ke="kubecolor exec -it"
alias kg="kubecolor get"
alias kl="kubecolor logs -f"
alias kcc="$SEARCH_TOOL current $KUBECONFIG"
alias kdm="kubecolor describe nodes -l kubernetes.io/role=master"
alias kdn="kubecolor describe nodes -l kubernetes.io/role=node"
alias kgm="kubecolor get nodes -l kubernetes.io/role=master"
alias kgn="kubecolor get nodes -l kubernetes.io/role=node"

# get shell access to nextcloud pod in nextcloud namespace
alias nextcloud_pod="kg pods -n nextcloud | grep -v postgres | grep -v metrics | tail -n 1 | awk '{print $1}'"
alias ncsh='ke -n nextcloud $(nextcloud_pod) -- /bin/sh'

# print every k8s secret in plain text... very secure 
function kgsdump() {
    BLUE='\033[1;34m'
    GREEN='\033[1;32m'
    NC='\033[0m'
    if [ -z $@ ]; then
        echo -e "󰛨  Usage: ksgdump SECRET"
    elif [[ $@ == "--help" ]]; then
        echo -e "󰛨  Usage: ksgdump SECRET"
    else
        counter=0
        # for every key in a secret, decode the base64 value and print it
        for secret in `kg secret $@ -o json | jq .data[]`; do
          key=`kg secret $@ -o json | jq .data | jq 'keys' | jq -r .[$counter]`
          value=`echo "$secret" | tr -d '"' | base64 --decode`
          echo -en "${BLUE}${key}${NC}: ${GREEN}$value${NC}\n"
          # tick up the counter
          let counter++
        done
    fi
}

# switch to different k8s envs
function kcs() {
    kubecolor config use-context k8s-$1.$domain
    if [ "$?" != "0" ]; then
        kubecolor config use-context k8s-$1.$domain
    fi
    kubecolor config set-context $(kubecolor config current-context) --namespace=default
}

# force delete function
function kfd() {
    kubecolor delete pod --grace-period=0 --force $1
}

# help text for k commands
function khelp {
  echo "k                   = kubecolor";
  echo "ka                  = kubecolor apply -f (applies a k8s yaml file to current cluster)";
  echo "kc                  = kubecolor config use-context (switch to EXACT cluster name)";
  echo "kd                  = kubecolor describe";
  echo "ke                  = kubecolor exec -it";
  echo "kg                  = kubecolor get";
  echo "kl                  = kubecolor logs -f (follow logs for a pod)";
  echo "k8p                 = switch to prod k8 instance";
  echo "k8dw                = switch to data warehouse k8 instance";
  echo "kcc                 = echoes current k8s cluster you're connecting to";
  echo "kcs <dev/qa/prod>   = switch current context to given namespace";
  echo "kdn                 = kubecolor describe nodes";
  echo "kfd <pod-name>      = force delete of pod";
  echo "kns <namespace>     = switch current context to given namespace";
  echo "kgsdump <secret>    = dump the contents of a secret in plain text";
};

# set current namespace function
function kns() {
    kubecolor config set-context $(kubecolor config current-context) --namespace=$1
}

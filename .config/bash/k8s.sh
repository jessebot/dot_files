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

alias k="kubecolor"
alias ka="kubecolor apply -f"
# cluster context shortcut
alias kcc="kubecolor config get-contexts"
alias kd="kubecolor describe"
alias ke="kubecolor exec -it"
alias kl="kubecolor logs -f"
alias kdm="kubecolor describe nodes -l kubernetes.io/role=master"
alias kdn="kubecolor describe nodes -l kubernetes.io/role=node"
alias kg="kubecolor get"
alias kgi="kubecolor get ingress"
alias kgcm="kubecolor get configmaps"
alias kgm="kubecolor get nodes -l kubernetes.io/role=master"
alias kgn="kubecolor get nodes -l kubernetes.io/role=node"
# get cnpg backups
alias kgpgb="kubecolor get backups.postgresql.cnpg.io -o custom-columns=name:.metadata.name,status:.status.phase"
# get k8up backups
alias kgb="kubecolor get backups -o custom-columns=name:.metadata.name,status:.status.conditions[-1].reason"
alias kgp="kubecolor get pods -o custom-columns=name:.metadata.name,status:.status.phase"
alias kgj="kubecolor get jobs -o custom-columns=name:.metadata.name,status:.status.conditions[0].type"
alias kpf="kubecolor port-forward"
alias kgsvc="kubecolor get service"

# get shell access to nextcloud pod in nextcloud namespace
alias nextcloud_pod="kg pods -n nextcloud -l app.kubernetes.io/component=app,app.kubernetes.io/instance=nextcloud-web-app,app.kubernetes.io/name=nextcloud"
alias ncsh='ke -n nextcloud $(nextcloud_pod) -- /bin/sh'

function kgall() {
    echo -e "\n─────────────────────────────────────────────────────────────────"
    echo -e "                           🐋 Pods 🐋"
    echo -e "─────────────────────────────────────────────────────────────────\n"
    kubecolor get pods
    echo -e "\n─────────────────────────────────────────────────────────────────"
    echo -e "                           💾 PVCS 💾"
    echo -e "─────────────────────────────────────────────────────────────────\n"
    kubecolor get pvc
    echo -e "\n─────────────────────────────────────────────────────────────────"
    echo -e "                          🤫 Secrets 🤫"
    echo -e "─────────────────────────────────────────────────────────────────\n"
    kubecolor get secrets
    echo -e "\n─────────────────────────────────────────────────────────────────"
    echo -e "                          ⚙️ ConfigMaps ⚙️"
    echo -e "─────────────────────────────────────────────────────────────────\n"
    kubecolor get configmaps
}

# alias a common typo
alias gkall="kgall"

# print every k8s secret in plain text... very secure
function kgsdump() {
    BLUE='\033[1;34m'
    GREEN='\033[1;32m'
    NC='\033[0m'
    if [ -z $@ ]; then
        echo -e "󰛨  ${BLUE}Usage${NC}: ${GREEN}kgsdump SECRET${NC}\n\nDumps all the keys for a given k8s SECRET in plain text\n"
        kubecolor get secrets
    elif [[ $@ == "--help" ]]; then
        echo -e "󰛨  ${BLUE}Usage${NC}: ${GREEN}kgsdump SECRET${NC}\n\nDumps all the keys for a given k8s SECRET in plain text"
        kubecolor get secrets
    else
        counter=0
        # for every key in a secret, decode the base64 value and print it
        for secret in `kg secret $@ -o json | jq .data[]`; do
          key=`kg secret $@ -o json | jq .data | jq 'keys' | jq -r .[$counter]`
          value=`echo "$secret" | tr -d '"' | base64 --decode`

          # pretty printing
          echo -en "${BLUE}${key}${NC}: ${GREEN}$value${NC}\n"

          # tick up the counter
          let counter++
        done
    fi
}

alias kgs="kgsdump"

# dump all secrets in your current namespace
function kgsdumpall() {
    BLUE='\033[1;34m'
    GREEN='\033[1;32m'
    NC='\033[0m'
    if [[ $@ == "--help" ]]; then
        echo -e "󰛨  ${BLUE}Usage${NC}: ${GREEN}ksgdumpall${NC}\n\nDump all the k8s secrets in the current namespace in plain text"
    else
        RES=$(kg secrets --no-headers=true | cut -d ' ' -f 1 | grep -v "tls")
        for secret in ${RES}; do
            kgsdump $secret
        done
    fi
}

# dump all tls secret manifests in the current namespace into files in current dir
function kdumpcerts() {
    BLUE='\033[1;34m'
    GREEN='\033[1;32m'
    NC='\033[0m'
    if [[ $@ == "--help" ]]; then
        echo -e "󰛨  ${BLUE}Usage${NC}: ${GREEN}kdumpcerts [-n NAMESPACE]${NC}\n\nDump all the k8s TLS secrets in the current namespace to files in the current directory"
    elif [[ $1 == "-n" ]]; then
        namespace=$2
        echo -e "Dumping all certs for namespace ${GREEN}$namespace${NC} to files."
        kubectl get secrets -n $namespace | grep '\-tls' | awk '{print $1}' | xargs -I % sh -c "kubectl get secret -n $namespace -o yaml % > %.yaml"
    else
        echo "Dumping all certs for current namespace to files."
        kubectl get secrets | grep '\-tls' | awk '{print $1}' | xargs -I % sh -c 'kubectl get secret -o yaml % > %.yaml'
    fi
}

alias kgscerts='kdumpcerts'

# force delete function
function kfd() {
    kubecolor delete pod --grace-period=0 --force $1
}

# set current namespace function
function kns() {
    kubecolor config set-context $(kubecolor config current-context) --namespace=$1
}

# use a new context
function kc() {
    kubecolor config use-context $1
}

# help text for k commands
function khelp {
  BLUE='\033[1;34m'
  GREEN='\033[1;32m'
  NC='\033[0m'
  echo -e "${GREEN}k${NC}                  = ${BLUE}kubecolor${NC}";
  echo -e "${GREEN}ka${NC}                 = ${BLUE}k apply -f (applies a k8s yaml file to current cluster)${NC}";
  echo -e "${GREEN}kc${NC}                 = ${BLUE}k config use-context (switch to EXACT cluster name)${NC}";
  echo -e "${GREEN}kcc${NC}                = ${BLUE}echoes current k8s cluster you're connecting to${NC}";
  echo -e "${GREEN}kd${NC}                 = ${BLUE}k describe${NC}";
  echo -e "${GREEN}kdn${NC}                = ${BLUE}k describe nodes${NC}";
  echo -e "${GREEN}ke${NC}                 = ${BLUE}k exec -it${NC}";
  echo -e "${GREEN}kfd${NC} <pod-name>     = ${BLUE}k force delete of pod${NC}";
  echo -e "${GREEN}kg${NC}                 = ${BLUE}k get${NC}";
  echo -e "${GREEN}kgall${NC}              = ${BLUE}k get (pods, secrets, configmaps, PVCs)${NC}";
  echo -e "${GREEN}kgb${NC}                = ${BLUE}k get backups${NC}";
  echo -e "${GREEN}kgcm${NC}               = ${BLUE}k get configmaps${NC}";
  echo -e "${GREEN}kgi${NC}                = ${BLUE}k get ingress${NC}";
  echo -e "${GREEN}kgj${NC}                = ${BLUE}k get jobs with only name and status columns${NC}";
  echo -e "${GREEN}kgpgb${NC}              = ${BLUE}k get backups.postgresql.cnpg.io${NC}";
  echo -e "${GREEN}kgp${NC}                = ${BLUE}k get pods with only name and status columns${NC}";
  echo -e "${GREEN}kgs${NC}                = ${BLUE}k get secrets${NC}";
  echo -e "${GREEN}kgsdump${NC} <secret>   = ${BLUE}dump the contents of a secret in plain text${NC}";
  echo -e "${GREEN}kgsvc${NC}              = ${BLUE}k get service${NC}";
  echo -e "${GREEN}kl${NC}                 = ${BLUE}k logs -f (follow logs for a pod)${NC}";
  echo -e "${GREEN}kns${NC} <namespace>    = ${BLUE}switch current context to given namespace${NC}";
  echo -e "${GREEN}kpf${NC} <namespace>    = ${BLUE}k port-forward${NC}";
};

# helm shortcuts
alias helmtmp='helm template . | bat -l yaml'

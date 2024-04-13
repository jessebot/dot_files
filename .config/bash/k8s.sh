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
alias kgcm="kubecolor get configmaps"
alias kl="kubecolor logs -f"
alias kcc="$SEARCH_TOOL current $KUBECONFIG"
alias kdm="kubecolor describe nodes -l kubernetes.io/role=master"
alias kdn="kubecolor describe nodes -l kubernetes.io/role=node"
alias kgm="kubecolor get nodes -l kubernetes.io/role=master"
alias kgn="kubecolor get nodes -l kubernetes.io/role=node"

# get shell access to nextcloud pod in nextcloud namespace
alias nextcloud_pod="kg pods -n nextcloud | grep -v postgres | grep -v metrics | tail -n 1 | awk '{print $1}'"
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
        echo -e "󰛨  ${BLUE}Usage${NC}: ${GREEN}kdumpcerts${NC}\n\nDump all the k8s TLS secrets in the current namespace to files in the current directory"
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

# help text for k commands
function khelp {
  echo "k                   = kubecolor";
  echo "ka                  = kubecolor apply -f (applies a k8s yaml file to current cluster)";
  echo "kc                  = kubecolor config use-context (switch to EXACT cluster name)";
  echo "kd                  = kubecolor describe";
  echo "ke                  = kubecolor exec -it";
  echo "kg                  = kubecolor get";
  echo "kgall               = kubecolor get (pods, secrets, configmaps, PVCs)";
  echo "kgcm                = kubecolor get configmaps";
  echo "kgs                 = kubecolor get secrets";
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

# helm shortcuts
alias helmtmp='helm template . | bat -l yaml'

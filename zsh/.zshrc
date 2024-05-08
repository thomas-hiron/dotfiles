export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/bin:$PATH"
export EDITOR="vim"
export KEYTIMEOUT=1

ZSH_THEME="gentoo"

plugins=(git)
ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

alias lla="ls -la"

alias ad="sudo apt update"
alias ag="sudo apt upgrade"

alias ga="git add ."
alias gl="git log --oneline"
alias gc="git commit -m"
alias gs="git status"
alias gri="git rebase -i"
alias gco="git checkout"
alias gbd="git branch -d"
alias gf="git fetch"
alias gsw="git switch"
alias gpr="git pull --rebase"

# git commit clickup
function gcc() {
    branch_name=$(git rev-parse --abbrev-ref HEAD | cut -d'_' -f1)
    git commit -m "$branch_name - $1"
}

alias dps="docker ps"
alias dcp="docker container prune -f"
alias dip="docker image prune -f"
alias dnp="docker network prune -f"
alias dvp="docker volume prune -f"
alias dk="docker kill"

alias mr="make restart"
alias mp="make php-cs-fixer"

alias tldr="docker run --rm tldr tldr"

function calc() {
  echo "$1" | bc -l
}

function generate_html_class_autocomplete() {
    temp_dir=$(mktemp -d)
    rg "\.[a-z][a-z0-9-]{3,}" -tcss --no-filename --json assets | jq -c '. 
                                        | select(.type == "match") 
                                        | {class: .data.submatches[].match.text, file: .data.path.text}' > $temp_dir/raw.json
    cat $temp_dir/raw.json | sort | uniq > $temp_dir/uniq.json
    cat $temp_dir/uniq.json | jq -sc 'map(. + {data: [{class: [.class], file: [.file]}]})
                                        | group_by(.class)[]
                                        | .[0] + {files: [.[].data[].file | add]}
                                        | del (.data, .file)' > $temp_dir/grouped.json
    sed -i 's/"\./"/' $temp_dir/grouped.json
    mv $temp_dir/grouped.json ~/generated_html_classes.json
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Non versionnable file
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/bin:$HOME/.cargo/bin:$PATH"
export EDITOR="vim"
export KEYTIMEOUT=1
export HISTSIZE=100000
export SAVEHIST=100000
export GPG_TTY=$(tty)

ZSH_THEME="simple"

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

source ~/.oh-my-zsh/custom/plugins/zsh-abbr/zsh-abbr.zsh
abbr m="make" 2>/dev/null

source <(fzf --zsh)

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#698fb0,fg+:#51677b,bg:#fafafa,bg+:#eef1f4
    --color=hl:#5079be,hl+:#2d5fb5,info:#afaf87,marker:#5079be
    --color=prompt:#5079be,spinner:#5079be,pointer:#5079be,header:#87afaf
    --color=border:#bac3cb,label:#aeaeae,query:#7a92a9
    --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> "
    --marker=">" --pointer="◆" --separator="─" --scrollbar="│"'

# Non versionnable file
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

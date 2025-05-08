export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export HOMEBREW_NO_ANALYTICS=1

export SAM_CLI_TELEMETRY=0

alias gs="git status"
alias gco="git checkout"
alias gp="git pull"
alias dc="docker-compose"
alias dps="docker ps"
alias dcc='docker rm $(docker ps -a -f status=exited -q)'
alias dci='docker rmi $(docker images -a -q) --force'
alias dbp='docker builder prune'
alias dvc='docker volume ls -q | xargs docker volume rm'
alias dclean='dci && dcc && dbp && dvc'
alias kua='kubectl apply -f k8s'
alias kud='kubectl delete service'
alias kusc='kubectl config use-context'
alias kul='kubectl logs -l --tail=50'
alias kuw='kubectl wait --timeout 300s'
alias kug='kubectl get'
alias kuga='kubectl get all -n'
alias miq='minikube start'

function dcup() {
  docker-compose up $1 --build
}
function dcub() {
  docker-compose up $1 -d --build
}
alias dcr="docker-compose restart"
alias dce="docker-compose exec"
alias taa="terraform apply --auto-approve"
alias gsp="git stash push --include-untracked --keep-index"
alias gfo="git fetch origin"
gitx() {
    if [ $# -eq 0 ]; then
        echo "Usage: gitx /path/to/folder"
    else
        open -a GitX "$1"
    fi
}

code() {
    if [ $# -eq 0 ]; then
        echo "Usage: code /path/to/file_or_folder"
    else
        open -a "Cursor" "$1"
    fi
}
ytmp3() {
    # Check if yt-dlp exists in PATH
    if ! command -v yt-dlp &> /dev/null; then
        echo "yt-dlp not found. Installing..."
        
        # Download yt-dlp binary
        curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_macos -o /usr/local/bin/yt-dlp
        
        # Make executable
        chmod a+rx /usr/local/bin/yt-dlp
        
        if ! command -v yt-dlp &> /dev/null; then
            echo "Failed to install yt-dlp"
            return 1
        fi
    fi

    # Check if ffmpeg exists
    if ! command -v ffmpeg &> /dev/null; then
        echo "ffmpeg is required but not installed. Please install ffmpeg first."
        return 1
    fi

    # Check if URL provided
    if [ -z "$1" ]; then
        echo "Usage: ytmp3 <youtube-url>"
        return 1
    fi

    # Download audio only and convert to mp3
    yt-dlp -x --audio-format mp3 "$1"
}


. "$HOME/.local/bin/env"
export GPG_TTY=/dev/ttys016
export GPG_TTY=$(tty)
export PATH="/usr/local/opt/gpg-agent/bin:$PATH"

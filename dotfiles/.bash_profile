# Aliased Paths
alias obs='cd /Users/roshan/Documents/notebook/obs-ws'
alias dpy='cd /Users/roshan/Developer/python'

# Aliased Commands
alias clip='pbcopy'
alias ca='conda activate'
alias ebash='nano ~/.bash_profile'

# Aliased Scripts
alias fixkbr='sh ~/Developer/setup/scripts/fix-kbr.sh'
alias dockon='sh ~/Developer/setup/scripts/dockon.sh'
alias dockoff='sh ~/Developer/setup/scripts/dockoff.sh'

# Prompt Settings

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

nvm use stable

echo "Logging in as $USER@$HOSTNAME"

# Function to get active branch in current directory
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# $CONDA_PROMPT_MODIFIER is the name of the conda environment

# Set custom prompt string
PS1='\n\[\033]0;$PWD\007\]\[\033[32m\][\t]\n\[\033[35m\]\[\033[33m\]\w\[\033[36m\] $(parse_git_branch)\[\033[0m\] 
$ '

PROMPT_COMMAND="echo"

# Helper Functions

function ti() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}

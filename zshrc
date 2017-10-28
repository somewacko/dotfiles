# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
if [ "$(uname)" '==' "Linux" ]; then
    ZSH_THEME="gallois"
elif [ "$(uname)" '==' "Darwin" ]; then
    ZSH_THEME="theunraveler"
fi
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Add scripts dir
export PATH="$PATH:$HOME/.dotfiles/scripts"

# fzf
if [ -f ~/.fzf.zsh ]; then
    source ~/.fzf.zsh
fi

# pyenv
if [ -d ~/.pyenv ]; then
    export PATH="/home/flynn/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
fi

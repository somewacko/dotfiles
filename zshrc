# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.zsh_custom

ZSH_THEME="remote"
PROMPT='%{$fg[cyan]%}[%c] %{$reset_color%}'
RPROMPT='%{$fg[cyan]%}$(git_prompt_info)%{$reset_color%} $(git_prompt_status)%{$reset_color%}'

plugins=(git)
source $ZSH/oh-my-zsh.sh

# scripts
export PATH="$PATH:$HOME/.dotfiles/scripts"

# cuda
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH="$CUDA_HOME/lib64:$LD_LIBRARY_PATH"
export PATH="$CUDA_HOME:$CUDA_HOME/bin:$PATH"

# fzf
if [ -f ~/.fzf.zsh ]; then
    source ~/.fzf.zsh
fi

# pyenv
if [ -d ~/.pyenv ]; then
    export PATH="/home/flynn/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
fi

# tensorflow
if [ -d ~/3rd/tensorflow ]; then
    export PATH="$PATH:$HOME/3rd/tensorflow/bazel-bin/tensorflow/tools/graph_transforms"
fi

# torch
if [ -d ~/torch ]; then
    . /home/flynn/torch/install/bin/torch-activate
fi

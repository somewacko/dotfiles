# ---- Set up oh-my-zsh

export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.zsh_custom


# Use different themes for different OSes
if [ "$(uname)" '==' "Linux" ]; then
    #ZSH_THEME="theunraveler"
    ZSH_THEME="remote"
elif [ "$(uname)" '==' "Darwin" ]; then
    ZSH_THEME="gallois"
fi
PROMPT='%{$fg[cyan]%}[%c] %{$reset_color%}'
RPROMPT='%{$fg[cyan]%}$(git_prompt_info)%{$reset_color%} $(git_prompt_status)%{$reset_color%}'

plugins=(git)

source $ZSH/oh-my-zsh.sh


# ---- Set PATH

export PATH="$HOME/.dotfiles/scripts:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"

eval "$(pyenv init -)"

# Set up CUDA
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH="$CUDA_HOME/lib64:$LD_LIBRARY_PATH"
export PATH="$CUDA_HOME:$CUDA_HOME/bin:$PATH"

# Add TensorFlow tools to PATH
if [ -d ~/3rd/tensorflow ]; then
    export PATH="$PATH:$HOME/3rd/tensorflow/bazel-bin/tensorflow/tools/graph_transforms"
fi

if [ -d ~/torch ]; then
    . /home/flynn/torch/install/bin/torch-activate
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="theunraveler"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# scripts
export PATH="$PATH:$HOME/.dotfiles/scripts"

# cuda
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH="$CUDA_HOME/lib64:$LD_LIBRARY_PATH"
export PATH="$CUDA_HOME:$CUDA_HOME/bin:$PATH"

# fzf
if [ -f $HOME/.fzf.zsh ]; then
    source $HOME/.fzf.zsh
fi

# pyenv
if [ -d $HOME/.pyenv ]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
fi

# tensorflow
if [ -d $HOME/tensorflow ]; then
    export PATH="$PATH:$HOME/tensorflow/bazel-bin/tensorflow/tools/graph_transforms"
fi

# torch
if [ -d $HOME/torch ]; then
    . $HOME/torch/install/bin/torch-activate
fi

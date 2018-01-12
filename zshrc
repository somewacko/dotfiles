# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.zsh_custom
ZSH_THEME="zo7"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# scripts
export PATH="$PATH:$HOME/.dotfiles/scripts"

# android
if [[ -d $HOME/android ]]; then
    export PATH="$PATH:$HOME/android/adb-sync"
    export PATH="$PATH:$HOME/android/platform-tools"
    export NDK_ROOT="$HOME/android/android-ndk-r15c"
fi

# cuda
if [[ -d /usr/local/cuda ]]; then
    export CUDA_HOME=/usr/local/cuda
    export LD_LIBRARY_PATH="$CUDA_HOME/lib64:$LD_LIBRARY_PATH"
    export PATH="$CUDA_HOME:$CUDA_HOME/bin:$PATH"
fi

# fzf
if [[ -f $HOME/.fzf.zsh ]]; then
    source $HOME/.fzf.zsh
fi

# pyenv
if [[ -d $HOME/.pyenv ]]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
fi

# tensorflow
if [[ -d $HOME/src/tensorflow ]]; then
    export PATH="$PATH:$HOME/tensorflow/bazel-bin/tensorflow/tools/graph_transforms"
fi

# torch
if [[ -d $HOME/torch ]]; then
    . $HOME/torch/install/bin/torch-activate
fi

# The next line updates PATH for the Google Cloud SDK.
if [[ -f "$HOME/src/google-cloud-sdk/path.zsh.inc" ]]; then
    source "$HOME/src/google-cloud-sdk/path.zsh.inc"
fi

# The next line enables shell command completion for gcloud.
if [[ -f "$HOME/src/google-cloud-sdk/completion.zsh.inc" ]]; then
    source "$HOME/src/google-cloud-sdk/completion.zsh.inc"
fi

# work stuff
if [[ -f "$HOME/loom.ai/third-party/configure" ]]; then
    source $HOME/loom.ai/third-party/configure
fi

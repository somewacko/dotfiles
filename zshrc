# ---- Set up oh-my-zsh

export ZSH=$HOME/.oh-my-zsh

# Use different themes for different OSes
if [ "$(uname)" '==' "Linux" ]; then
    ZSH_THEME="gallois"
elif [ "$(uname)" '==' "Darwin" ]; then
    ZSH_THEME="theunraveler"
fi
plugins=(git)

source $ZSH/oh-my-zsh.sh


# ---- Aliases

# Prefer Neovim over Vim
alias vim=nvim


# ---- Set up ROS

if [ -d "/opt/ros" ]
then
    # Find and source the newest available ROS version
    if [ -e "/opt/ros/kinetic/setup.zsh" ]; then
        source /opt/ros/kinetic/setup.zsh
    elif [ -e "/opt/ros/jade/setup.zsh" ]; then
        source /opt/ros/jade/setup.zsh
    elif [ -e "/opt/ros/indigo/setup.zsh" ]; then
        source /opt/ros/indigo/setup.zsh
    else
        echo "Warning: Found /opt/ros but no ROS installation found!"
    fi

    # Set up default catkin workspace
    if [ -e "$HOME/catkin_ws/devel/setup.zsh" ]; then
        source $HOME/catkin_ws/devel/setup.zsh
    fi

    # Non-catkin workspaces
    if [ -e "$HOME/ros_ws/setup.zsh" ]; then
        source $HOME/ros_ws/setup.zsh
    fi
fi

eval "$(pyenv init -)"


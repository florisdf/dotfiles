# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/fdf/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
POWERLEVEL9K_MODE='nerdfont-complete'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set Vi mode
# bindkey -v
# Set key timeout to 0.1 seconds
# export KEYTIMEOUT=1

# Create GIT_CLONES envvar
export GIT_CLONES=$HOME/git_clones
export FLO_SCRIPTS=$HOME/scripts
export FLOJECTS=$HOME/projects

alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# Cuda
export PATH="/usr/local/cuda-8.0/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH"
export CUDA_HOME="/usr/local/cuda"

# Set visible cuda devices to the Quadro K4200 with compute capability 3
export CUDA_VISIBLE_DEVICES=0

# virtualenv and virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV=/home/fdf/.local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh

# Caffe Root
export CAFFE_ROOT=$GIT_CLONES/caffe/
export PYTHONPATH=$GIT_CLONES/caffe/distribute/python:$PYTHONPATH
export PYTHONPATH=$GIT_CLONES/caffe/python:$PYTHONPATH

# PyOpenPose
export PYTHONPATH=$PYTHONPATH:$GIT_CLONES/PyOpenPose/build/PyOpenPoseLib

# Add scripts to python path for easy imports
export PYTHONPATH=$PYTHONPATH:$FLO_SCRIPTS:$GIT_CLONES

# Add blender modules to python path
export PYTHONPATH=$PYTHONPATH:/usr/share/blender/scripts/modules

# Add Cargo's bin directory to PATH for Rust
export PATH="$PATH:$HOME/.cargo/bin"

# Add MATLAB bin to PATH
export PATH="$PATH:/usr/local/MATLAB/R2017b/bin"

# Add .local/bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# Powerline ZSH prompt
#powerline-daemon -q
#. "$HOME/.local/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh"

PATH="/home/fdf/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/fdf/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/fdf/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/fdf/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/fdf/perl5"; export PERL_MM_OPT;

# Require virtualenv when installing with pip
export PIP_REQUIRE_VIRTUALENV=true
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7

# Configure pip so that it tries to reuse already installed packages
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# Include docker-compose command line completion directory
fpath=(~/.zsh/completion $fpath)

# In order for MatCaffe to work (see https://github.com/BVLC/caffe/issues/5447)
export LD_PRELOAD=$LD_PRELOAD:/usr/lib/x86_64-linux-gnu/libstdc++.so.6

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set PROJECT_HOME to the dir where new virtualenv projects need to be created
export PROJECT_HOME=$FLOJECTS

# Set EDITOR envvar
export EDITOR=/usr/bin/nvim

# Alias open command
alias open=xdg-open

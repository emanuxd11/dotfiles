# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="EminemsFirstSingle"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-autosuggestions
  zsh-syntax-highlighting
  fast-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# editor stuff, last line adds the path to .local/bin which is used to execute lunarvim
export VISUAL=lvim
export EDITOR=lvim
export PATH="$HOME/.local/bin":$PATH

# aliases
alias nv="lvim"
alias xopen="xdg-open"
alias gnomo-connect="ssh up202107486@gnomo.fe.up.pt"
alias killx="killall Xorg"
alias sdnv="sudo -E -s lvim"
alias cat="bat"
alias gac="git add -A && git commit -m" # + commit message
alias gcache="git config --global credential.helper 'cache --timeout=9999999999999'"

# to be honest not sure what this is or when I added it
PATH="/home/manu/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/manu/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/manu/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/manu/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/manu/perl5"; export PERL_MM_OPT;


# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

DEFAULT_USER="tobin"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-syntax-highlighting)


source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/bin:/usr/local/sbin/:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/tobin/.gem/ruby/2.4.0/bin

# alias some shit
alias vim="nvim"
alias pyserve="python3 -m http.server 8080"
alias fucking="sudo"
alias pushit="git push $1 $2 && ~/scripts/push-it"
alias journal='touch ~/Documents/journal/`date +%F`.md  && (vim ~/Documents/journal/`date +%F`.md)'
alias distupgrade="sudo pacman -Syy && sudo pacman -S manjaro-keyring && sudo pacman -Suu"
alias autoremove="yaourt -Qtd"
alias distclean="yaourt -Scc"
alias logoff="qdbus org.kde.ksmserver /KSMServer logout 0 0 0"
alias killplasma="kbuildsycoca4 && kquitapp plasmashell && kstart plasmashell"
alias mirrorupdate="sudo pacman-mirrors -g && sudo pacman -Syy"
alias bserve="browser-sync start --server --files \"**/*.css\" --files \"**/*.js\" --files \"**/*.html\""
alias exit="sh ~/.dotfiles/seeyouspacecowboy.sh; sleep 1; exit"
alias updatekeys="sudo pacman-key --init && sudo pacman-key --populate archlinux manjaro && sudo pacman-key --refresh-keys"
alias kp="kdbxviewer -t ~/Documents/keepass.kdbx -S"
alias dev="~/.dotfiles/tmux-dev.sh"
alias youtubed="youtube-dl -x --audio-format mp3 --audio-quality 0"

# fortunes
# Run on new shell
if [ `which fortune` ]; then
    echo ""
    fortune
    echo ""
fi


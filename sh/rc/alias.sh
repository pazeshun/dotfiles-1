# vim: set ft=sh:

# basic
alias sudo='sudo '
alias c='clear'
alias lv='less'

# open
type gnome-open &>/dev/null && alias open=gnome-open
alias o='open'
alias o.='open .'

# browsing
alias gcal='open https://www.google.com/calendar/render#g >/dev/null 2>&1'
alias gmail='open https://mail.google.com/mail/u/0/ >/dev/null 2>&1'

# vim
type vim &>/dev/null && {
  alias v='vim'
  alias vi='vim'
  alias vii='vim --noplugin'
  alias viii='vim -u NONE'
}
type nvim &>/dev/null && {
  alias n='nvim'
  alias nvi='nvim'
  alias nvii='nvim --noplugin'
  alias nviii='nvim -u NONE'
}

# emacs
alias emacs='emacs -nw'

# python
alias py='python'
alias ipy='ipython'
alias ipp='ptipython'

# ruby
alias irb='irb --simple-prompt'

# cmatrix
alias matrix='cmatrix -sb'

# tmux
alias t='tmux'
alias tls='tmux ls'
alias ta='tmux attach'
alias tat='tmux attach -t'
alias tn='tmux new'
alias tns='tmux new -s'

# gifify
gifify () {
  docker run -it --rm -v `pwd`:/data maxogden/gifify $@
}

# wstool
alias wl=wstool
alias wli='wstool info'
alias wlcd='wstool_cd'
alias wlset='wstool set'
alias wlup='wstool update'

# brew
if type brew &>/dev/null; then
  alias bubu='brew update && brew upgrade && brew cleanup'
  alias bububu='bubu && brew cask update && brew cask cleanup'
fi

# ----------------------------------------------------
# pandoc
# ----------------------------------------------------
md2rst () {
  pandoc --from=markdown --to=rst $1
}
rst2md () {
  pandoc --from=rst --to=markdown $1
}

# ----------------------------------------------------
# wrapping with rlwrap
# ----------------------------------------------------
if type rlwrap &>/dev/null; then
  alias eus='rlwrap eus'
  alias irteusgl='rlwrap irteusgl'
  alias roseus='rlwrap roseus'
  alias irb='rlwrap irb'
  alias clisp="rlwrap -b '(){}[],#\";| ' clisp"
fi

# ----------------------------------------------------
# ROS
# ----------------------------------------------------
if [ -d "/opt/ros" ]; then
  alias rqt_gui='rosrun rqt_gui rqt_gui'
  alias rqt_reconfigure='rosrun rqt_reconfigure rqt_reconfigure'
  alias rqt_image_view='rosrun rqt_image_view rqt_image_view'
  image_view () {
    rosrun image_view image_view image:=$1
  }
fi

# ----------------------------------------------------
# ls aliases
# ----------------------------------------------------
alias sl='ls'
if ls --color &>/dev/null; then
  # GNU ls
  if [ $TERM = "dumb" ]; then
    # Disable colors in GVim
    alias ls='ls -F --show-control-chars'
    alias la='ls -ahF --show-control-chars'
    alias ll='ls -lhF --show-control-chars'
    alias lsa='ls -lahF --show-control-chars'
  else
    # Color settings for zsh complete candidates
    alias ls='ls -F --show-control-chars --color=always'
    alias la='ls -ahF --show-control-chars --color=always'
    alias ll='ls -lhF --show-control-chars --color=always'
    alias lsa='ls -lahF --show-control-chars --color=always'
    if type dircolors &>/dev/null; then
      if [ -f $HOME/.colorrc ]; then
        eval `dircolors $HOME/.colorrc`
      fi
    fi
  fi
else
  # Darwin ls
  alias ls='ls -F'
  alias la='ls -ahF'
  alias ll='ls -lhF'
  alias lsa='ls -lahF'
fi

# diff-highlight
if ! type diff-highlight &>/dev/null; then
  mkdir -p $HOME/.local/bin
  wget https://raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight -O $HOME/.local/bin/diff-highlight
  chmod u+x $HOME/.local/bin/diff-highlight
fi

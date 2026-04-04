source ~/.local/share/calos/default/bash/rc

# set up fzf key bindings and fuzzy completion

eval "$(fzf --bash)"

# yazi key functionality improvement

function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

# terminal upgrades

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
mkcd() { mkdir "$1" && cd "$1"; }

# aliases

alias oops='sudo $(history -p !!)'
alias la='eza --icons=auto -a'
alias ls='eza --icons=auto'
alias grep='grep --color=auto'
alias dota='steam steam://rungameid/570/'
alias please='sudo'
alias cat='bat --style grid,header,header-filename,header-filesize '
alias update='~/wksp/system-update.sh start'
alias upgrade='~/wksp/system-update.sh start'
alias svim='sudoedit '
alias list-packages='calos-pkg-list'
alias packages='calos-pkg-list'
alias showoff='clear && fastfetch && echo $'\n' && fortune'
alias monitor-mode='~/wksp/monitor-swap.sh'
alias tv-mode='~/wksp/tv-mode.sh'
alias bigpicture='steam steam://open/bigpicture && exit'

# first terminal boot service

if ! systemctl is-active --quiet bootmsg; then
  clear
  hyprctl -q hyprsunset temperature 6600
  echo
  echo "Welcome to $HOSTNAME! Running initial startup scripts and daemon diagnostics:"
  pamixer --set-volume 80
  systemctl --failed
  echo
  sudo systemctl start bootmsg.service
  echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
  echo "governor successfully set!"
  echo
  echo "Todays quote is:"
  fortune
  echo
  echo "happy autisming"
  echo
fi

# starship config

export STARSHIP_CONFIG=~/.config/starship.toml

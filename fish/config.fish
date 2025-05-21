set fish_greeting

set -x EDITOR nvim
set -x VISUAL nvim

set -x PAGER bat


set -x LC_ALL C.UTF-8

function fish_user_key_bindings
  fish_vi_key_bindings

  bind -M insert -m default j,k cancel repaint-mode
end

zoxide init fish | source

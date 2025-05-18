set fish_greeting


function fish_user_key_bindings
  fish_vi_key_bindings

  bind -M insert -m default j,k cancel repaint-mode
end

zoxide init fish | source

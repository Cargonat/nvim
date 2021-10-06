(module config.keys
  {autoload {nvim aniseed.nvim
             keys which-key}})

; disable arrow keys
(nvim.set_keymap :n :<up> :<nop> {:noremap true})
(nvim.set_keymap :n :<down> :<nop> {:noremap true})
(nvim.set_keymap :n :<left> :<nop> {:noremap true})
(nvim.set_keymap :n :<right> :<nop> {:noremap true})
(nvim.set_keymap :i :<up> :<nop> {:noremap true})
(nvim.set_keymap :i :<down> :<nop> {:noremap true})
(nvim.set_keymap :i :<left> :<nop> {:noremap true})
(nvim.set_keymap :i :<right> :<nop> {:noremap true})
(nvim.set_keymap :v :<up> :<nop> {:noremap true})
(nvim.set_keymap :v :<down> :<nop> {:noremap true})
(nvim.set_keymap :v :<left> :<nop> {:noremap true})
(nvim.set_keymap :v :<right> :<nop> {:noremap true})

; move current line up and down using <A-j> and <A-k>
(nvim.set_keymap :n :<A-j> ":m .+1<CR>==" {:noremap true})
(nvim.set_keymap :n :<A-k> ":m .-2<CR>==" {:noremap true})
(nvim.set_keymap :i :<A-j> "<Esc>:m .+1<CR>==gi" {:noremap true})
(nvim.set_keymap :i :<A-k> "<Esc>:m .-2<CR>==gi" {:noremap true})
(nvim.set_keymap :v :<A-j> "'>+1<CR>gv=gv" {:noremap true})
(nvim.set_keymap :v :<A-k> "'<-2<CR>gv=gv" {:noremap true})

(keys.register {
                :<C-j> [":set paste<CR>m`o<Esc>``:set nopaste<CR>" "Insert empty line below"]
                :<C-k> [":set paste<CR>m`O<Esc>``:set nopaste<CR>" "Insert empty line above"]})

(module config.plugin.debugger
  {autoload {nvim aniseed.nvim
             keys which-key}})

(keys.register 
  { :<leader>d {
                :name :+debug
                :d ["<Cmd>lua vim.lsp.buf.declaration()<CR>" "declaration"]
                :c ["<Cmd>:lua require'dap'.continue()<CR>" "continue"]
                :n ["<Cmd>:lua require'dap'.step_over()<CR>" "step over / next"]
                :i ["<Cmd>:lua require'dap'.step_into()<CR" "step into"]
                :o ["<Cmd>:lua require'dap'.step_out()<CR>" "step out"]
                :b ["<Cmd>:lua require'dap'.toggle_breakpoint()<CR>" "toggle breakpoint"]
                :B ["<Cmd>:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>" "conditional breakpoint"]
                :l ["<Cmd>:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>" "logpoint"]
                :r ["<Cmd>:lua require'dap'.repl.open()<CR>" "repl"]
                :p ["<Cmd>:lua require'dap'.run_last()<CR>" "run previous"]
                }} 
  {:buffer bufnr})

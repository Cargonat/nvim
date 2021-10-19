(module config.init
  {autoload {core aniseed.core
             nvim aniseed.nvim
             util config.util
             str aniseed.string}})

; generic mapping leaders configuration
(nvim.set_keymap :n :<space> :<nop> {:noremap true})
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

; don't wrap lines
(nvim.ex.set :nowrap)

; sets a nvim global options
(let [options {
               ; settings needed for compe autocompletion
               :completeopt "menuone,noselect"

               ; case insensitive search
               :ignorecase true
               ; smart search case
               :smartcase true

               ; hybrid line numbers (relative except on current line)
               :relativenumber true
               :number true

               ; Indentation
               :expandtab true
               :autoindent true
               :smartindent true
               :tabstop 4
               :softtabstop 4
               :shiftwidth 4

               ; max. text width
               :textwidth 80

               :timeoutlen 500
               }]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))

; highlighted yank
(vim.api.nvim_command "au TextYankPost * silent! lua vim.highlight.on_yank {higroup=\"IncSearch\", timeout=500}")

; import plugin.fnl
(require :config.plugin)

; import key-mappings.fnl
(require :config.keys)

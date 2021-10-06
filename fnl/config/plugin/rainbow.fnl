(module config.plugin.rainbow
  {autoload {nvim aniseed.nvim
             ts-config nvim-treesitter.configs}})

(ts-config.setup {:rainbow {:enable true :extended_mode true :max_file_lines 10000}})

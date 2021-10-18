(module config.plugin.telescope
  {autoload {nvim aniseed.nvim
             telescope telescope
             keys which-key}})

(telescope.setup {:defaults {:file_ignore_patterns ["node_modules"]}
                  :pickers {:find_files {:find_command ["rg" "--files" "--iglob" "!.git" "--hidden"]}}})

(keys.register
  { :<leader>f {
                :name :+find
                :f [":lua require('telescope.builtin').find_files()<CR>" "find files"]
                :g [":lua require('telescope.builtin').live_grep()<CR>" "grep"]
                :b [":lua require('telescope.builtin').buffers()<CR>" "find buffers"]
                :h [":lua require('telescope.builtin').help_tags()<CR>" "help tags"]
                }})
